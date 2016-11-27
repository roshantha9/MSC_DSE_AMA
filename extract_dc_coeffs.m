% ================================================================================
% Advanced Multimedia Applications
% Title 	  : Extract DC Coefficients (extract_dc_coeffs.m)
% Description : Take out the DC coefficients(1,1) from a given cell
% Input       : cell (combination of matrices)
% Output	  : Array of DC-coeffs of each sub-matrix
% ================================================================================
function all_dc_coeffs = extract_dc_coeffs(cell)
    
	% invert
    cell = cell';
	
	% run a loop to get the (1,1) value from each sub-matrix
    for  i = 1:(length(cell)*length(cell))    
        all_dc_coeffs(i) = cell{i}(1,1);
    end    
end


