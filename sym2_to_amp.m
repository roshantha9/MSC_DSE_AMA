%=================================================================================
% Advanced Multimedia Applications
% Title			: Symbol-2 to Amplitude Converter(sym2_to_amp.m)
% Description	: Converts an AC/DC Symbol-2 to signed integer format
% Input  		: symbol-2, category
% Output 		: Codeword
%=================================================================================
function amp = sym2_to_amp(sym2, cat)
    
        % check for positive values
        if(sym2(1) == '1')
            amp = bin2dec(sym2);    

        % check for negative values
        elseif(sym2(1) == '0')

            % add a '1' at the front before converting to binary
			ones_comp_str = ['1' sym2];        
            dec = bin2dec(ones_comp_str);
            bin = dec2bin(bitxor(dec,2^16-1)); % 16bit binary xor(compliment)

            % use 'cat' to get the lower number of bits
            bin_low_bits = bin(end-(cat-1):end);

            % get corresponding negative value of the decimal
            amp = bin2dec(bin_low_bits) *-1; 

        % throw error
        else
            error('unknown sym2');
        end
%     end
end