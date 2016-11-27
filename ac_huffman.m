% ================================================================================
% Advanced Multimedia Applications
% Title		  : AC Huffman Encoding function (ac_huffman.m)
% Description : input would be the sequence after Zig-Zag
%               zerolen is the number of continuing 0, amplitude is the value  
%               of non-0 number after that
%               do Huffman after every AC RLC, the result is bit_seq
%               blockACbit_seq is the endocing result of whole block
% 
% 			    AC Codeword - [symbol-1, symbol-2]
% 			    symbol-1 = (run-length, size)
% 			    symbol-2 = (amplitude)
%
% Input 	  : AC-components (after zigzag coding)
% Output	  : blockACbit_seq    (encoded bit sequence)
%				blockbit_len 	  (length of bit sequence)
%				zero_nonzero_pair (RLC pairs)
% ================================================================================
function[blockACbit_seq,blockbit_len,zero_nonzero_pair]=ac_huffman(after_z)
    
	% initialisation
    e = after_z;
    eob_seq=dec2bin(10,4); % eob=1010(end symbol)
    blockACbit_seq=[];
    blockbit_seq=[];
    zerolen=0;
    zeronumber=0;
    
    zero_nonzero_pair = {};
    n=1;
    
    
    if numel(e)==1           %% the situation of all AC factors are 0
        blockACbit_seq=[];        
        blockbit_len=length(blockbit_seq);
    else
        for i=2:length(e) %the AC part is from the second number
            
            if ( e(i)==0 & zeronumber<15)
                zeronumber=zeronumber+1;
                  
                
            elseif ((e(i)==0) & (zeronumber==15)) %(15, 0) = 16 zeros                
                zeronumber=0;
                blockACbit_seq=[blockACbit_seq,'11111111111111111'];   
                
                % save RLC pair
                zero_nonzero_pair{n} = [15 0];
                n=n+1;
                 
             elseif(e(i))  %if value non-equal to zero
                      
                      % save RLC pair
                      zero_nonzero_pair{n} = [zeronumber e(i)];
                      n=n+1; 
           
                      zerolen=zeronumber;          
                      amplitude=ac_category(e(i));
                      zeronumber=0;
                      
                      bit_seq=tableAC2(zerolen,amplitude);
                      
                      % get symbol-2
                      symbol_2 = amp_to_sym2(e(i),amplitude);
                      
                      % append symbol-1 and symbol-2 to the overall bit
                      % string.                     
                      blockACbit_seq=[blockACbit_seq,bit_seq,symbol_2];                     
             end
        end
    end                
    
           blockACbit_seq = [blockACbit_seq eob_seq];    
           blockbit_len=length(blockACbit_seq);
           
           % blockACbit_seq is the sequence for the AC part
           % blockbit_len is the length
           % the sequence of whole block would be: 
           % blockbit_seq=[blockDCbit_seq,blockACbit_seq,eob_seq];
end

        
        
    