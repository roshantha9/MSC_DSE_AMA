% test App3
clc;clear;close all;




%data = [126  126  126  125  126  121  126  124] % original input data

datasize = 8; % number of data items
data = round(-128 + (128+128).*rand(datasize,1))'

disp('DCT-simple');
dct_coeffs = dct_1(data)      % perform 1D-DCT
idata = round(idct_1(dct_coeffs));    % perform 1D-IDCT

subplot(2,1,1);
stem(data);grid on;title('Original Data - 8 values');
subplot(2,1,2);
stem(dct_coeffs);grid on;title('DCT-Coefficients');


disp('DCT-fast');
dct_coeffs = fdct_1(data)      % perform 1D-DCT
idata = fidct_1(dct_coeffs);    % perform 1D-IDCT


