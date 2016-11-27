% ================================================================================
% Advanced Multimedia Applications
% Title		   : DPCM Decoder (dc_dpcm_dec.m)
% Description  : Differential decoding of Diffs.
% Input  	   : Differential codes (array)
% Output 	   : Diff (differentially decoded output, array)
% ================================================================================
function dc_coeffs = dc_dpcm_dec(diffs)
    
    % first coeff is the same as first diff
    dc_coeffs = zeros(1,length(diffs));
    dc_coeffs(1) = diffs(1);   % first dc value is the same as first diff
    
	% loop through the differentials
    for i=2:length(diffs)
        dc_coeffs(i) = diffs(i)+dc_coeffs(i-1);
    end    
    
end