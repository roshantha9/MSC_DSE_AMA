% ================================================================================
% Advanced Multimedia Applications
% Title 	  : Inverse-1D-DCT (idct_1.m)
% Description : 1D- Discrete Cosine Transform.
% Input       : dct coefficients (array)
% Output 	  : inverse-dct results (array)	
% ================================================================================
function idct1_result = idct_1(coeffs)
	
	% get array length
    N = length(coeffs);
	
	% preallocate
    gx = zeros(1,N);
	
	% first term C(u)
    Cu = [(1/sqrt(2)) ones(1,N-1)];
    
	% reset sum term
    sum_term = 0;
    
	% outer loop
    for x = 1:N   
        
		% inner loop
        for u = 1:N
            sum_term = sum_term + (Cu(u)*coeffs(u)*cos((((2*(x-1))+1)*(u-1)*pi)/...
																		   (2*N)));           
        end
        
		% scale factor for each sum term
        gx(x) = sqrt(2/N) * sum_term;
        
        sum_term = 0; % reset sum term
        
    end
    
	% output
    idct1_result = gx;  
    
