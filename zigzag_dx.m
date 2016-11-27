%=================================================================================
% Advanced Multimedia Applications
% Title 	  : ZigZag Encoder (zigzag_e.m)
% Description : Zig-zag decoder for matrixs
% 				usage =>     optdata = zigzag_dx(inpdata);
% 				The function scans the zig-zag input data(inpdata) and returns
% 				it as a normal matrix form.
% Input		  : matrix
% Output	  : sorted data (matrix)
%=================================================================================

function [out_data] = zigzag_dx(idata)

[xlen,ylen] = size(idata);      % getting size of matrix
if xlen ~= ylen                 % checking for square matrix
    disp('  ');
    disp('Zig-Zag decoder ERROR : Square matrix needed as input.');
    disp('  ');
    return;
end;

out_data = zeros(xlen , ylen);  % initialising output matrix
temp_a = zeros(xlen , ylen);    % initialising temporary matrix

for i = 1 : xlen
    for j = 1 : ylen % setting index numbers for temporary matrix
        temp_a(i,j) = (((i-1) *xlen )+j);
    end
end
temp_b = zigzag_e(temp_a); % zigzag-ing temporary matrix

% scanning tempporary matrix for calculating output data positions
for i = 1 : xlen
    for j = 1 : ylen 
        out_data(fix(((temp_b(i,j)-1)/xlen)+1),temp_b(i,j)-((fix((temp_b(i,j)-1)...
													/xlen)*xlen))) = idata(i,j);
    end
end

