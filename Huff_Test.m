% Advanced Multimedia Applications
% Title      : JPEG/MPEG Encoding-Decoding - Top Level Test Script
% Description: Performs JPEG Encoding and Decoding. The parameter section
%              will contain various input parameters to the different sub
%              sections
%              Sub-sections:
%              --------------
%               Encoder:
%                   - DCT (2D)
%                   - Quantisation
%                   - ZigZag Scanning (AC-coeffs), DPCM (DC-coeffs)
%                   - RLC and VLC (Huffman)
%
%               Decoder:
%                   - Huffman Decoding
%                   - Reverse ZigZag(AC-coeffs), DPCM-Decoding(DC-coeffs)
%                   - Inverse-Quantisation
%                   - IDCT (2D)
% ------------------------------------------------------------------------

clc;clear;close all;

%=====================================================================
%       T E S T  -  S C R I P T   P A R A M E T E R S
%=====================================================================

% -- image params --
file_ext = 'bmp';  % currently supports : bmp, pgm

filename = 'lena512.bmp';      %[Test-image-1]
%filename  = 'cameraman256.pgm'; %[Test-image-2]
%filename = 'barb256.pgm';      %[Test-image-3]
%filename  = 'xilinx.bmp';      %[Test-image-4]
%filename  = 'child.bmp';       %[Test-image-5]
%filename  = 'smooth.bmp';      %[Test-image-6]

% -- DCT params --
speed   = 1;     % 0-simple dct, 1-fast dct

% -- Non-Linear Quantisation Params --
q_type  = 'L';  % NL = Non-Linear, L=Linear 
q_ratio = 30;

% -- Linear Quantisation Params --
step_size = 1;
cut_off   = 0;


%=====================================================================
%       INITIALISATION
%=====================================================================

% ---- Load the Image File ----

if strcmp(file_ext,'pgm')
    [img,rows,cols,maxlum] = loadPGM(filename);
    %imshow(img);    
    colormap(gray(255));
    image(img); title('Original')        
elseif strcmp(file_ext,'bmp')
    img = imread(filename);
    imshow(img); title('Original')        
else
    error('Unknown Filetype');
end

img = double(img)-128;
[m,n] = size(img);
b = 8;

num_blocks = (m*n)/(b*b);
num_hor_blks = m/b;
num_ver_blks = n/b;

enc_achuff_blk_bitlen=0;
enc_dc_coeffs_array = zeros(num_hor_blks,num_ver_blks);


%=====================================================================
%       M P E G/J P E G     E N C O D E R     
%=====================================================================

% split the input larger matrix into smaller 8x8 blocks
split_img = mat2cell(img, b*ones(m/b,1), b*ones(1,n/b));

% perform DCT->Quantisation->Inverse-Quantisation->IDCT for each block
for i = 1:num_ver_blks
    for j = 1:num_hor_blks

        % --------------- 2D-DCT -------------------------------------
        % perform DCT - Encoder side
        % (output is a array of cells)
        enc_dct_block = dct_2_8x8(split_img{i,j},b,speed)';
        
        test_enc_dct_block{i,j} = enc_dct_block;

        % --------------- Quantisation -------------------------------
        if strcmp(q_type, 'NL')
            enc_q_block =  NL_Quantizer(enc_dct_block,q_ratio,0);        
        elseif strcmp(q_type, 'L')           
            enc_q_block = L_Quantizer(enc_dct_block,0,step_size,cut_off);            
        else
            error('unknown q_type');
        end
        
        test_enc_q_blocks{i,j} = enc_q_block;

        % --------------- Zig-Zag Scanning (AC Coeffs) ----------------
        enc_zz_block = zigzag_e(enc_q_block);
        enc_zz_block = reshape(enc_zz_block',1,b*b);
        
        test_enc_zz_block{i,j} = enc_zz_block;
        
        % save DC-Coefficient (for DPCM coding later)
        enc_dc_coeffs_array(i,j) = enc_zz_block(1);

        % --------------- RLC and Huffman Coding (AC Coeffs) ----------
        [blockACbit_seq,blockbit_len, zero_nonzero_pair]=ac_huffman(enc_zz_block);
        
        % save bit string
        enc_achuff_bits{i,j} = blockACbit_seq;
        % accumulate block-AC-bit-length
        enc_achuff_blk_bitlen = enc_achuff_blk_bitlen+blockbit_len;        

    end
end

% --------------- DPCM Encoding (DC Coeffs) -------------------
enc_dc_coeffs_array = reshape(enc_dc_coeffs_array,1,num_blocks);

% DPCM encode the extracted coeffs
enc_dpcm_diffs = dc_dpcm_enc(enc_dc_coeffs_array);

% --------------- RLC and Huffman Coding (DC Coeffs) ----------
[blockDCbit_seq,blockbit_len]=dc_huffman(enc_dpcm_diffs);
% save the encoded codewords
enc_dchuff_bits = blockDCbit_seq;
% save the dc codeword bits length
enc_dchuff_blk_bitlen = blockbit_len;
        

%=====================================================================
%       M P E G/J P E G   D E C O D E R     
%=====================================================================

% --------------- RLC and Huffman Decoding (DC Coeffs) ---------------
dec_dpcm_diffs = huffman_dc_decoding(enc_dchuff_bits);

% --------------- DPCM Decoding (DC Coeffs) --------------------------
dec_dc_coeffs_array = dc_dpcm_dec(dec_dpcm_diffs);
dec_dc_coeffs_array = reshape(dec_dc_coeffs_array,num_hor_blks,num_ver_blks);   


for i = 1:num_ver_blks
    for j = 1:num_hor_blks
    
    % --------------- RLC and Huffman Decoding (AC Coeffs) ---------------
    % prepend dc coeff at the front
    dec_huff_ac_coeffs_blk{i,j}  = [dec_dc_coeffs_array(i,j) ...
                                huffman_ac_decoding(enc_achuff_bits{i,j})];
    dec_huff_ac_coeffs_blk{i,j}  = reshape(dec_huff_ac_coeffs_blk{i,j},b,b)';
    
    % --------------- Reverse Zig-Zag Scanning (AC Coeffs) ---------------
    dec_zz_blocks{i,j} = zigzag_dx(dec_huff_ac_coeffs_blk{i,j});
    
    % --------------- Inverse - Quantisation----------------------
    if strcmp(q_type, 'NL')
        dec_q_block =  NL_Quantizer(dec_zz_blocks{i,j},q_ratio,1);         
    elseif strcmp(q_type, 'L')          
        dec_q_block = L_Quantizer(dec_zz_blocks{i,j},1,step_size,cut_off);       
    else
        error('unknown q_type');
    end
    
     % --------------- 2D - Inverse - DCT -------------------------
     dec_idct_block{i,j} = idct_2_8x8(dec_q_block,b, speed)';    
     reconstructed_cell{i,j} = dec_idct_block{i,j};
    
    
     clc;display(['Finished Decoding block=',num2str(i),',',num2str(j)])
    
    end
end

% convert the array of cells back to a matrix
reconstructed_img = cell2mat(reconstructed_cell);     

% add back the 128, and convert to uint8 (to be displayed)
reconstructed_img = reconstructed_img + 128;
reconstructed_img = uint8(reconstructed_img);

% display reconstructed picture
figure;imshow(reconstructed_img); title('Reconstructed')        


%=====================================================================
%       A N A L Y S I S   
%=====================================================================

img_size_before_compression = (m*n)*8   % 8-bits per pixel
img_size_after_compression = enc_achuff_blk_bitlen+enc_dchuff_blk_bitlen

bpp = img_size_after_compression/(m*n)

compression_ratio = 100 - ((img_size_after_compression/img_size_before_compression) * 100)

%close all

