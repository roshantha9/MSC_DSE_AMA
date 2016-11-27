% ================================================================================
% Advanced Multimedia Applications
% Title		  : huffman DC decoding function (huffman_dc_decoding.m)
% Description : this function is to do the Inverse huffman coding for dc 
%               part the input should be the whole sequence including the
%               output of DC, the idea is to match the sequence with the 
%               code in decode table, get the category of the value then cut 
%               the relative number,change them into decimal
%
% Input 	  : binary sequence (string)
% Output	  : decoded dc-coefficients(array)
% ================================================================================
function [dc_dehuff]=huffman_dc_decoding(blockbit_seq)
dc_dehuff=[];point=1;
len=length(blockbit_seq);
r_new=0;
for i = point:len  %'point' is a variable to mark the start bit of each 
                   %code, 'len' is the length of the code put into the
                   %decode table
    temp_dc = blockbit_seq(point:i);
    category_dc = detableDC(temp_dc);
    
    if(category_dc == 0) % to distinguish between 0 and -1 
        r_new = 0;
        dc_dehuff=[dc_dehuff,r_new];
        point = i + category_dc+1;
        i = point;
		
    %get correct output
    elseif category_dc > 0 && category_dc <= 11;
       % while doing the loop to match the decoding table, for other 
       % situations the category_dc would be 12
          category_dc;                                   
        r_dc = blockbit_seq(i+1:i+category_dc);
        r_new = sym2_to_amp(r_dc,category_dc);
          dc_dehuff=[dc_dehuff,r_new];

          point = i + category_dc+1;
          i = point;
    end

    r_new;
    
    
end   %finish DC part
%dc_dehuff

            
