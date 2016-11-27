% ================================================================================
% Advanced Multimedia Applications
% Title 		: 1D-DCT (simple) (dct_2_simple.m)
% Description 	: 2D - DCT (Simple), using basic transform equations
% Input 		: image samples (NxN matrix)
% Output		: DC-coefficients (NxN matrix)
% ================================================================================
function dct2_result = dct_2_simple(data)
    
    N = length(data);   % we assume that height=width    
    xn = data;
    Xij = zeros(N,N);   % NxN matrix needed to store result
    
    % preallocation	
    sum_k=zeros(1,N);
    sum_l=0;
    inner = zeros(1,N);
    
    % first outer loop for the rows    
    for i=1:N
		% second outer loop for the rows    
        for j=1:N     
            % first inner loop for the outer summation
			for k = 1:N                    
                % second inner loop for the cos term summation
                for l = 1:N              
                    inner(l) = xn(k,l) * cos(((2*pi)*((i-1)/(2*N))*((k-1)+0.5)))...
										* cos(((2*pi)*((j-1)/(2*N))*((l-1)+0.5)));            
                end
                
				% get sum of inner loop terms
                sum_l = sum(inner);                    
                % summation of the k terms
                sum_k(k) = sum_l;
                % reset the summation (for the next run of the loop)
                sum_l = 0;
            end
            
			% summation for the first inner loop
            sum_kk = sum(sum_k);
            
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
            
            Xij(i,j) = (2/N)* ci * cj * sum_kk;
            
			% reset the summations (for the next run of the loop)
            sum_k =0;
            sum_kk = 0;
        end         
        
		% output status
        %clc;display(['Finished Encoding =',num2str(i),',',num2str(j)])        
    end   
    
    % send output
    dct2_result = Xij;
    
    