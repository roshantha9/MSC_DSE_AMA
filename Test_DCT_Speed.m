%=================================================================================
% Advanced Multimedia Applications
% Title 	  : Test Script for Simple and Fast DCT (1D) (Test_DCT_Speed.m)
% Description : Test Script to Measure speed of FAST-DCT vs. SIMPLE-DCT (1D)
%			    Measuring speed over several test cases(getting average)
%=================================================================================
clc;clear;close all;

% ----- parameters -----
datasize = 8; % number of data items
sample_size = 10000; % number of speed measurements taken

for i=1:sample_size
    
    % generate random 8 numbers between -128 and 127
    data = round(-128 + (128+128).*rand(datasize,1))';
        
    % --- run simple-dct/idct ---
    tstart = tic;  % start timer
    dct_coeffs = dct_1(data);           % perform 1D-DCT
    idata = round(idct_1(dct_coeffs));  % perform 1D-IDCT
    simple_telapsed(i) = toc(tstart);  	% stop timer
    
	% if original data is different to reconstructed data then inform
    if(idata ~= data)
        data
        idata
        error('simple-dct-operation failed');
    end
    
    % --- run fast-dct/idct ---
    tstart = tic;  % start timer
    dct_coeffs = fdct_1(data);       % perform 1D-DCT
    idata = fidct_1(dct_coeffs);     % perform 1D-IDCT
    fast_telapsed(i) = toc(tstart);  % stop timer    
    
	% if original data is different to reconstructed data then inform
    if(idata ~= data)
        data
        idata
        error('fast-dct-operation failed');
    end    
        
end

% calculate average of results
mean_time_difference = mean(simple_telapsed-fast_telapsed)

% plot results
plot(simple_telapsed-fast_telapsed,'b');
title('Simple vs. Fast DCT/IDCT Execution Speed Difference, No. of Tests =10000');
ylabel('Elapsed Time Difference');xlabel('Test No.');
grid on;
