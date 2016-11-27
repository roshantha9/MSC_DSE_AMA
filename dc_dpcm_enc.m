% ================================================================================
% Advanced Multimedia Applications
% Title		   : DPCM Encoder (dc_dpcm_enc.m)
% Description  : Differential coding of DC-Components
% Input  	   : dc_coeffs_from_each_block (array)
% Output 	   : Diff (differentially encoded outputs, array)
% ================================================================================
function diff = dc_dpcm_enc(dc_coeffs_from_each_block)
    
	% first value is encoded against zero
    dc_vals = [0 dc_coeffs_from_each_block];
    
    i = 2:length(dc_vals);        
    diff = dc_vals(i)-dc_vals(i-1);

end