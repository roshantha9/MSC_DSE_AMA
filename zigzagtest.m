% ================================================================================
% Advanced Multimedia Applications
% Title		  : Test app for Zigzag encoder and decoder (zigzagtest.m)
%
% Description : The application makes an input 8x8 matrix with incrimenting values.
% 				Then the test matrix is zigzag encoded and the result decoded using
% 				zigzag decoder. Then, all three matrixs are displayed and the test 
%				matrix and recustructed matrix are checked for errors.
% ================================================================================

test_m = ones(8,8); % initialsising input matrix
for i = 1 : 8
    for j = 1 : 8
        test_m(i,j) = ((i-1)*8)+j; % setting incrimenting values to matrix
    end;
end;

temp_m1 = zigzag_e(test_m); % zigzag encoding test matrix
temp_m2 = zigzag_d(temp_m1);% decoding original matrix from zigzag encoded matrix

% display matrix contents
disp('Original matrix');
disp(test_m);
disp('');
disp('Zigzag encoded matrix');
disp(temp_m1);
disp('');
disp('Reconstructed matrix');
disp(temp_m2);

% checking whether test matrix and recunstructed matrix are same
if (isequal(temp_m2,test_m)) 
    disp('Success: Perfect functioning');
else
    disp('Error');
end;
