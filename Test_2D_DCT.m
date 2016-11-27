%=================================================================================
% Advanced Multimedia Applications
% Title 		: 2D-DCT Image analysis Test Script (Test_2D_DCT.m)
% Description   : Test Script for 2D_DCT Image Analysis. Analysis is done
%				  block by block for the whole image.
%=================================================================================

clc;clear;close all;

%=====================================================================
%       T E S T  -  S C R I P T   P A R A M E T E R S
%=====================================================================

img = imread('lena512.bmp');
imshow(img);

% img = imread('Cameraman.bmp');
% imshow(img);

img = double(img)-128;
[m,n] = size(img);
b = 8;

num_blocks = (m*n)/(b*b);
num_hor_blks = m/b;
num_ver_blks = n/b;

speed   = 0;     % 0-simple dct, 1-fast dct

%=====================================================================
%       INITIALISATION
%=====================================================================

% split the input larger matrix into smaller 8x8 blocks
split_img = mat2cell(img, b*ones(m/b,1), b*ones(1,n/b));

% subplot index
sp=1;


%=====================================================================
%       DISCRETE COSINE TRANSFORM
%=====================================================================
tstart = tic;

% perform DCT --> IDCT for each block
for i = 1:num_ver_blks
    for j = 1:num_hor_blks

        % --------------- 2D-DCT -------------------------------------
        % perform DCT - Encoder side
        % (output is a array of cells)
        enc_dct_block = dct_2_8x8(split_img{i,j},b,speed)';      
        test_enc_dct_block{i,j} = enc_dct_block;            
        

%=====================================================================
%       INVERSE - DISCRETE COSINE TRANSFORM
%=====================================================================

        % --------------- 2D - Inverse - DCT -------------------------
        dec_idct_block{i,j} = idct_2_8x8(enc_dct_block,b, speed)';    
        reconstructed_cell{i,j} = dec_idct_block{i,j};    
        
        display(['Finished Decoding block=',num2str(i),',',num2str(j)])
    
    end
end

% get time taken for system
telapsed = toc(tstart)

% convert the array of cells back to a matrix
reconstructed_img = cell2mat(reconstructed_cell);     

% add back the 128, and convert to uint8 (to be displayed)
reconstructed_img = reconstructed_img + 128;
reconstructed_img = uint8(reconstructed_img);

% display reconstructed picture
figure;imshow(reconstructed_img);

%imshow(abs(split_img{1,1}));

%=====================================================================
%       OUTPUT TEST RESULTS
%=====================================================================

% ---  work on block :(i,j) ---
i=30;j=32;

% original block matrix
img_block = split_img{i,j}

% output of 2D-DCT
dct_2_8x8 = test_enc_dct_block{i,j}

% print out basic transform output
dct_2_simple = dct_2_simple(split_img{i,j})

% output of 2D-IDCT
idct_2_8x8 = round(dec_idct_block{i,j})

% are they equal ??
img_block == idct_2_8x8

% ---  analyse a combination of blocks :(i,j) ---

% subplot the dct blocks (somewhere around the middle of the image)
for i = 30:39
    for j = 30:39

        subplot(10,10,sp);
        imshow(abs(test_enc_dct_block{i,j}));
        sp=sp+1;
        
        display(['Finished plotting block=',num2str(i),',',num2str(j)])
        
    end
end

figure;sp=1;
% subplot the original blocks
for i = 30:39
    for j = 30:39

        subplot(10,10,sp);
        imshow(uint8(split_img{i,j}+128));
        sp=sp+1;
        
        display(['Finished plotting block=',num2str(i),',',num2str(j)])
        
    end
end




