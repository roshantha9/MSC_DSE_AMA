%=================================================================================
% Advanced Multimedia Applications
% Title       : 2D-IDCT on a NxN matrix (idct_2.m)
% Description : Performs 2D-Inverse DCT, for a whole image, using block wise 
%				2D-DCT  (N should be divisible by 8)
% Input		  : mat - input matrix is a bxb matrix
%			    speed - use fast/slow(simple) dct
% Output	  : a cell array, of DCT blocks(8x8 block size)
%=================================================================================


function idct_2_result = idct_2(mat,speed)

% split into bxb blocks
[m,n] = size(mat);
b=8;

if(mod((m*n),(b*b)) ~= 0)
    error('mat size not a multiple of block size - 8x8');
end

% split the input larger matrix into smaller 8x8 blocks
split_mat = mat2cell(mat, b*ones(m/b,1), b*ones(1,n/b));

for r = 1:length(split_mat) %rows
    for c = 1:length(split_mat) %cols
        
        block = split_mat{r,c};
        
        idct_block = idct_2_8x8(block,b,speed);  % 0-simple dct, 1-fast dct      
       
        idct_cell_array(r,c) = {idct_block};    
        
    end    
end

idct_2_result = idct_cell_array;