%=================================================================================
% Advanced Multimedia Applications
% Title 	    : 2D-DCT Speed Test (Test_2DDCT_Speed.m)
% Description   : Test Script for 2D_DCT - to measure speed between the 
% 				  row and column wise 2D-DCT and the 2D-DCT using basic
%				  transform equations.
%=================================================================================

clc;clear;close all;
%=====================================================================
%       T E S T  -  S C R I P T   P A R A M E T E R S
%=====================================================================

max_datasize = 128; % maximum datasize to check
speed = 0;        %(using simple, 1D-DCT equation on rows and colums)


%=====================================================================
%       T E S T  -  M A I N   L O O P
%=====================================================================

i=1;
for datasize=8:8:max_datasize 

    % the data - a random matrix
    data = round(-128 + (128+128).*rand(datasize,datasize))';
    
    % perform the 2D-DCT - using the 2D-DCT basic transform equation 
    tstart = tic;
    dct2_s  = dct_2_simple(data);
    telapsed_dct2_s(i) = toc(tstart);

    % perform the 2D-DCT - using 1D-DCT transform equations
    % rows first then columns.
    tstart = tic;
    dct2_rc = dct_2_8x8(data,datasize,speed)';
    telapsed_dct2_rc(i) = toc(tstart);
    
    i=i+1;
    
    display(['Finished Test, datasize=',num2str(datasize)])
    
end

% display speed results on graph
% plot in logarithmic scale
datasize=[8:8:max_datasize];
semilogy(datasize,telapsed_dct2_rc,'b');
hold on;
semilogy(datasize,telapsed_dct2_s,'r');
grid on;

