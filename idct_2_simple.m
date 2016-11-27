%=================================================================================
% Advanced Multimedia Applications
% Title       : Simple 2D-IDCT (idct_2_simple.m)
% Description : Performs 2D-Inverse DCT using basic transform equations.
% Input		  : dct-coefficients(matrix) 
% Output	  : original samples (matrix)
%=================================================================================
function dct2_result = idct_2_simple(coeffs)
    
    N = length(coeffs);   % we assume that height=width
    
	% initialisation
    XN = coeffs;
    Xkl = zeros(N,N); % NxN matrix needed to store result
    sum_i=0;
    sum_j=0;
        
	% first outer loop	
    for k=1:N
		%second outer loop
        for l=1:N

			% first inner loop
            for i = 1:N
				% second inner loop
                for j = 1:N              
                                         
                    % calculating and adding the cj term 
                    if(i==1)
                        ci = 1/sqrt(2);
                    else
                        ci = 1;
                    end;

                    if (j==1)
                        cj = 1/sqrt(2);
                    else
                        cj = 1;
                    end;                               
                    
					% inner main cosine calculation
                    inner =  ci * cj * XN(i,j) * cos(((2*pi)*((i-1)/(2*N))*...
							((k-1)+0.5))) * cos(((2*pi)*((j-1)/(2*N))*((l-1)+0.5)));            
                    
                    sum_j = sum_j + inner;                
                    
                end
				% get summarion for second inner loop
                sum_i = sum_i + sum_j;
                sum_j = 0;
            end
            % get result for first inner loop
            Xkl(k,l) = (2/N) * sum_i; 
            sum_i = 0;
           
        end         
    end
    
    dct2_result = Xkl;