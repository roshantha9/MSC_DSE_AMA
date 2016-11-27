% ================================================================================
% Advanced Multimedia Applications
% Title       : huffman AC decoding function (huffman_ac_decoding.m)
% Description : this function is to do the Inverse huffman coding the 
%               input should be the whole sequence including the output 
%               AC components and EOB, the idea is to match the sequence
%               with the code in decode table, get the category of the value
%
% Input		  :  binary sequence (string)
% Output	  :  AC-coefficients (array)
% ================================================================================
function [ac_dehuff]=huffman_ac_decoding(blockbit_seq)
ac_dehuff=[];point=1;
len=length(blockbit_seq);

for i = point:len  %'point' is a variable to mark the start bit of each 
                   %code, 'len' is the length of the code put into the
                   %decode table
    temp_ac = blockbit_seq(point:i);
    group_ac = detableAC2(temp_ac);
    
    if group_ac(1,1)==0 && group_ac(1,2)==0; % EOB reached.
       group_ac; 
       
       ac_dehuff = [ac_dehuff zeros(1,63-length(ac_dehuff))];    
       
       break
    
    elseif group_ac(1,2) >= 0 && group_ac(1,2) <= 10;%get correct output
       % while doing the loop to match the decoding table, for other 
       % situations the group_ac(1,2)would be 11
        group_ac;                                     
      
       for zero = 1: group_ac(1,1)
          ac_dehuff=[ac_dehuff, 0];
       end

        %ac_dehuff = [ac_dehuff zeros(1,group_ac(1,1));
      
        if group_ac(1,2)==0;
            ac_dehuff=[ac_dehuff, 0];
        else                  
         r_ac = blockbit_seq(i+1:i+group_ac(1,2));
          if r_ac(1)=='0';   %% if it's a negative number
            for j=1:length(r_ac)
                 if r_ac(j)=='0';
                     r_ac(j)='1';
                 else
                     r_ac(j)='0';
                 end
            end     
            r_new=-bin2dec(r_ac);
           else r_new=bin2dec(r_ac);
          end
          r_new;
          ac_dehuff=[ac_dehuff,r_new];
        end    
     point=i+group_ac(1,2)+1;  %once decoded the current code, move to the
                               %next number
     i=point;
     ac_dehuff;
    end
end %finish AC part
ac_dehuff;     
    
    
    
    
    