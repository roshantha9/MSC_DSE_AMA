%=================================================================================
% Advanced Multimedia Applications
% Title       : Linear Quantizer/inv-Quantizer for matrixs (L_Quantizer.m)
% Description :  For *qunatisattion* 
%				 -----------------------------
%                Set rev = 0 to set to quantsation mode
%                idata is the input matrix of 8 x 8 
%                
% 				 For *inv-qunatisattion* 
%			     -----------------------------
% 				 Set rev = 1 to set to inv-quantsation mode
% 			     idata is the input matrix of 8 x 8 and 
% 				 odata is the non linaraly quantsied output
%
% Input		 : idata 		(input data - matrix)
%			   rev	 		(rev=1 - inverse-quantisation)
%			   step_size 	(quantisation step size)
%			   cut_off 		(cut-off for the quantisation)
% Output	 : odata -  non linaraly quantsied output / original data samples
%			   rate - number of zeros indirectly specifiying the data loss 
%=================================================================================
function [odata,rate] = L_Quantizer(idata,rev,step_size,cut_off)

[xlen,ylen] = size(idata);      % getting size of matrix
if (xlen ~= 8) || (ylen ~= 8)   % checking for 8x8 matrix
    disp('  ');
    disp('Quantzer ERROR : 8x8 matrix needed as input.');
    disp('  ');
    return;
end;        

      Q  = ones(8,8)*step_size;                       % Specifiying Q matrix
  
  if (rev == 0)   % for qunatizing 
    odata = round(idata./Q);                  % Quantising matrix
    odata(odata < cut_off & odata > (cut_off *-1)) = 0;         % engaging cut_off 
    rate = sum(sum(odata == 0));         % counting zeros(data loss)
  else
    odata = idata.*Q;
    rate = 0;
  end;
  
  
  
  
  
   
  
  
  