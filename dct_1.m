% ================================================================================
% Advanced Multimedia Applications
% Title		  : 1D-DCT (dct_1.m)
% Description : Performs 1-Dimentional Discrete Cosine Transform using basic
% Input 	  : image samples (array)
% Output	  : DCT-Coefficients
% ================================================================================
function dct1_result = dct_1(data)
    
    N = length(data);	% get length of the intput sample
    
    gn = data;
    GK = zeros(1,N);    % 1x8 matrix needed to store result
    
    sum_term = 0;		
    
	% calculate the first G(k) term
    GK(1) = (1/sqrt(N))*sum(data);	
    
    % outer loop
    for k = 2:N 
		
		% inner loop
        for n = 1:N
            % the summation term
			sum_term = sum_term + (gn(n) * cos((((2*(n-1))+1)*(k-1)*pi)/(2*N)));
        end         
        
		% final scaling of the dct output
        GK(k) = sqrt(2/N)*sum_term;
        
        sum_term = 0; % reset sum term
        
    end
    
	% produce the output
    dct1_result = GK;
    
    