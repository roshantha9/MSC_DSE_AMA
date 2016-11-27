% ================================================================================
% Advanced Multimedia Applications
% Title		  : 2D-DCT  (dct_2.m)
% Description : 2D-DCT on a NxN matrix (N should be divisible by 8)
%				returns - a cell array, of DCT blocks(8x8 block size)
% Input 	  : image samples (matrix), speed (1=fast, 0=simple)
% Output	  : DCT-Coefficients (cell array)
% ================================================================================
function dct_2_result = dct_2(mat,speed)

% split into bxb blocks
[m,n] = size(mat);
b=8;

% check if the image size is a multiple of block size
if(mod((m*n),(b*b)) ~= 0)
    error('image size not a multiple of block size - 8x8');
end

% split the input larger matrix into smaller 8x8 blocks
split_img = mat2cell(mat, b*ones(m/b,1), b*ones(1,n/b));

% loopiing through the rows
for r = 1:length(split_img) %rows
    % loopiing through the cols
	for c = 1:length(split_img) %cols
        
		% get each block
        block = split_img{r,c};
        
		% perform 2d-block dct on each block
        dct_block = dct_2_8x8(block,b,speed);  % 0-simple dct, 1-fast dct      
		
		% save dct result
        dct_cell_array(r,c) = {dct_block};  
        
    end    
end

% point to output
dct_2_result = dct_cell_array;

