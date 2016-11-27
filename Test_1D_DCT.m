%=================================================================================
% Advanced Multimedia Applications
% Title 	  : Test Script for Simple and Fast DCT (1D) (Test_1D_DCT.m)
% Description : Testing using a random 8 sample array.
%				Checking time taken by each function
%=================================================================================
clear;clc;

% -------- simple 1D-DCT --------

data = [-88   121   113     3    66   -13   -50    77]% original input data

datasize = 8; % number of data items
%data = round(-128 + (128+128).*rand(datasize,1))'

tic  % start timer
dct_coeffs = dct_1(data)      		 % perform 1D-DCT
idata = round(idct_1(dct_coeffs))    % perform 1D-IDCT
toc  % stop timer

% check if original data is the same as reconstructed data
if(any(data == round(idata)))
    fprintf('1D-DCT successful\n');
else
    fprintf('1D-DCT unsuccessful\n');
end

% -------- simple 1D-FDCT --------

tic  % start timer
fdct_coeffs = fdct_1(data);      % perform 1D-FDCT
idata = fidct_1(fdct_coeffs);    % perform 1D-IDCT
toc  % stop timer

% check if original data is the same as reconstructed data
if(any(data == round(idata)))
    fprintf('1D-FDCT successful\n');
else
    fprintf('1D-FDCT unsuccessful\n');
end
