% ================================================================================
% Advanced Multimedia Applications
% Title		   : DC huffman encoding (dc_huffman.m)
% Description  : Huffman Coding of DC-Coefficients (using Huffman tables)
% Input  	   : DC components (array)
% Output 	   : binary sequence(string), length of sequence
% ================================================================================
function [blockDCbit_seq,blockbit_len]=dc_huffman(dc_seq)
    blockDCbit_seq=[];
    blockbit_seq=[];    
    e = dc_seq;
    len = length(dc_seq);
    for i =1:len;
     amplitude=dc_category(e(i)); % get category
     bit_seq=tableDC(amplitude);  % get basecode

         if(amplitude == 0) % if the number is 0 
             blockDCbit_seq=[blockDCbit_seq,bit_seq];
             blockbit_len=length(blockDCbit_seq);
         else     
            symbol_2 = amp_to_sym2(e(i),amplitude);    
            blockDCbit_seq=[blockDCbit_seq,bit_seq,symbol_2];
            blockbit_len=length(blockDCbit_seq);
         end
         
         
    end  
    %blockDCbit_seq is the sequence for the DC part
    %blockbit_len is the length