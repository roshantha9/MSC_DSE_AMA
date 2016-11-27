% ================================================================================
% Advanced Multimedia Applications
% Title		  : Amplitude-to-Symbol2 Conversion (amp_to_sym2.m)
% Description : Converts an Amplitude value to a Symbol-2 binary code
% Input  	  : Amplitude, Category
% Output 	  : Symbol-2
% ================================================================================
function sym2 = amp_to_sym2(amp,cat)

    if(amp == 0) % special case for zero
        sym2 = '0';        
    elseif (amp > 0)
        sym2 = dec2bin(amp,cat);
    elseif (amp < 0)
   
		% need to typecast and get 2's compliment first        
        twos_comp = dec2bin(bitxor(uint16(abs(amp)),2^16-1));         
        sym2 = twos_comp(end-(cat-1):end);       
            
    else
        amp
        error('unknown amp');
    end
    
end