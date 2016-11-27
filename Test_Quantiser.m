%=================================================================================
% Advanced Multimedia Applications
% Title 	  : Test Script for Quantiser/Inverse Quantiser (Test_Quantiser.m)
% Description : Test Script to verify the output of the quantiser functions, and 
%				to obtain error statistics after quantisation.
%=================================================================================

clc;clear

%=====================================================================
%       TEST - SCRIPT PARAMETERS
%=====================================================================

img = imread('york.bmp');
imshow(img);


img = double(img)-128;
[m,n] = size(img);
b = 8;
zer_count =0;
speed  = 1;     % 0-simple dct, 1-fast dct
q_type = 'L';  % NL = Non-Linear, L=Linear 

q_ratio = 90; % Non-Linear quantisation ratio
L_step_size = 32; % Linear quantisation step size
L_cut_off =8; % Linear quantisation cut off level
%=====================================================================
%       E N C O D E R
%=====================================================================

% split the input larger matrix into smaller 8x8 blocks
split_img = mat2cell(img, b*ones(m/b,1), b*ones(1,n/b));

% perform DCT->Quantisation->Inverse-Quantisation->IDCT for each block
for i = 1:length(split_img)
    for j = 1:length(split_img)

        % --------------- 2D-DCT ---------------------------------------------
        % perform DCT - Encoder side
		% output is a array of cells
        enc_dct_block = dct_2_8x8(split_img{i,j},b,speed);      

        % --------------- Quantisation ---------------------------------------
        if (q_type == 'NL')
            [enc_q_block,zer] =  NL_Quantizer(enc_dct_block,q_ratio,0);  
            zer_count = zer_count+zer;
        elseif(q_type == 'L')
            [enc_q_block,zer] =  L_Quantizer(enc_dct_block,0,L_step_size,L_cut_off);   
            zer_count = zer_count+zer;
        else
            error('unknown q_type');
        end


    %=====================================================================
    %       D E C O D E R
    %=====================================================================

        % --------------- Inverse - Quantisation------------------------------
        if (q_type == 'NL')
            dec_q_block =  NL_Quantizer(enc_q_block,q_ratio,1);         
        elseif(q_type == 'L')
            dec_q_block = L_Quantizer(enc_q_block,1,L_step_size,L_cut_off);    
        else
            error('unknown q_type');
        end

    % --------------- 2D - Inverse - DCT ---------------------------------

        dec_idct_block = idct_2_8x8(dec_q_block,b, speed);    
        reconstructed_cell{i,j} = dec_idct_block;

    end
end
reconstructed_img = cell2mat(reconstructed_cell);     % output is a matrix
quant_error = img - reconstructed_img; % cheching error

% add back the 128, and convert to uint8
reconstructed_img = reconstructed_img + 128;
reconstructed_img = uint8(reconstructed_img);

% display picture
%-----------------------
figure;imshow(reconstructed_img);


 MSE = sum(sum((quant_error.* quant_error)))/(m*n); % calculating MSE
 SNR = 10*log10(var(reshape(quant_error',1,m*n))/MSE);% calculating SNR
 PeakSNR = 10*log10((255^2)/MSE);% calculating peak SNR

 disp(strcat('MSE =',num2str(MSE)));
 disp(strcat('SNR =',num2str(SNR)));
 disp(strcat('PeakSNR =',num2str(PeakSNR)));
 disp(strcat('Zero% =',num2str((zer_count/(256*256))*100)));
% imwrite(reconstructed_img,'C:\Users\xxx\Desktop\nl\test.bmp');


