%=================================================================================
% Advanced Multimedia Applications
% Title		  : DC-Coefficients Huffman Table (tableDC.m)
% Description : DC Huffman Co-efficients of Luminance (used for Encoding)
%				Tables taken from [R.C Gonzalez, R.E Woods - "Digital Image
% 				Processing, Prentice Hall(2008)]
% input       : Category
% output      : Base Codeword
%=================================================================================
function basecode=tableDC(category)
    
	% large conditional statement containing the category to basecode mapping	
    if category==0
        basecode='00';
    elseif category==1
        basecode='010';
    elseif category==2
        basecode='011';
    elseif category==3
        basecode='100';
    elseif category==4
        basecode='101';
    elseif category==5
        basecode='110';
    elseif category==6
        basecode='1110';
    elseif category==7
        basecode='11110';
    elseif category==8
        basecode='111110';
    elseif category==9
        basecode='1111110';
    elseif category==10
        basecode='11111110';
    elseif category==11
        basecode='111111110';
    end    
