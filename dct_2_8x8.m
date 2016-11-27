% ================================================================================
% Advanced Multimedia Applications
% Title  		  : dct_2_result (dct_2_8x8.m)
% Description     : 2D-DCT, using 1D-DCT, can toggle
%				    between fast/simple DCT
% Input 	      : mat2d - input matrix (8x8),
%			        b - block size
%			        dct_type - fast(1)/simple(0) DCT
% Output		  : DCT-Coefficients (Matrix 8x8)
% ================================================================================
function dct_2_result = dct_2_8x8(mat2d,b, dct_type)
    
    % check if the supplied block size matches the matrix size
    if(b ~= length(mat2d))
        error('Input Matrix size does not match block size');
    end
    
    % check dct type - fast/simple, else throw an error
    if(dct_type == 1 || dct_type == 0)
        if(dct_type == 1)
            % check if block size is 8, else throw an error
			if(b ~= 8)
                error('Fast DCT can only be supported for 8x8 blocks');
            end   
        end
    else
        error('Unknown DCT Type, select 1(fast), 0(slow)');
    end  
        
    % preallocate for speed    
    dct_block = zeros(b,b);
    dct_block2 = zeros(b,b);
    
    % first do rows
    for j = 1:b 
		% decide on fast/slow dct
        if(dct_type == 1)
            dct_block(j,:) = fdct_1(double(mat2d(j,:))); % rows (fast)
        else
            dct_block(j,:) = dct_1(double(mat2d(j,:)));  % rows (simple)
        end
    end
    
	% the result of the dct on rows
    dct_block_rows = dct_block;     
    
    % then do columns on the transform of the rows
    for i = 1:b
         % decide on fast/slow dct
		 if(dct_type == 1)
            dct_block2(:,i) = fdct_1(double(dct_block_rows(:,i))); % cols  (fast)
         else
            dct_block2(:,i) = dct_1(double(dct_block_rows(:,i))); % cols (simple)
         end      
    end

    dct_2_result = dct_block2';

