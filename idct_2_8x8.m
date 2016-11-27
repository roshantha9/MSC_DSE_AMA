%=================================================================================
% Advanced Multimedia Applications
% Title       : 2D-IDCT (8x8 block), using 1D-IDCT (idct_2_8x8.m)
% Description : Performs 2D-Inverse DCT using basic transform equations.
% Input		  : mat2d - input matrix is a bxb matrix
%			    b - block size
% 				idct_type = 1('fast idct'), 0('simple idct')
% Output	  : original samples (matrix)
%=================================================================================
function idct_2_result = idct_2_8x8(mat2d,b, idct_type)
    
    % check if the supplied block size matches the matrix size
    if(b ~= length(mat2d))
        error('Input Matrix size does not match block size');
    end
    
    % check dct type - fast/simple
    if(idct_type == 1 || idct_type == 0)
        if(idct_type == 1)
            if(b ~= 8)
                error('Fast IDCT can only be supported for 8x8 blocks');
            end   
        end
    else
        error('Unknown IDCT Type, select 1(fast), 0(slow)');
    end  
        
    % preallocate for speed    
    idct_block = zeros(b,b);
    idct_block2 = zeros(b,b);
    
    % first do cols
    for i = 1:b                    
        if(idct_type == 1)
            idct_block(:,i) = fidct_1(double(mat2d(:,i)));  % cols (fast)
        else
            idct_block(:,i) = idct_1(double(mat2d(:,i)));  % cols (simple)
        end
    end
    
    idct_block_rows = idct_block;    
    
    % then do columns on the transform of the rows
    for j = 1:b
         if(idct_type == 1)
            idct_block2(j,:) = fidct_1(double(idct_block_rows(j,:))); % rows  (fast)
         else
            idct_block2(j,:) = idct_1(double(idct_block_rows(j,:))); % rows (simple)
         end      
    end
	
	% invert the output
    idct_2_result = idct_block2';

