%=================================================================================
% Advanced Multimedia Applications
% Title			: Non linear Quantizer/Inv-Quantzer (NL_Quantizer.m)
% Description	: usage =>      [Qunat_data,rate] = NL_Quantizer(idata,ratio,rev)
					
% 				For qunatisattion 
%				-----------------------------
% 				Set rev = 0 to set to quantsation mode
% 				idata is the input matrix of 8 x 8 and ratio is the quality level 
%				of quantsed matrix. The higher the quality, lesser the comprssion.
% 				odata is the non linaraly quantsied output and rate give the number
% 				of zeros indirectly specifiying the data loss
% 				----------------------

% 				For inv-qunatisattion 
%				-----------------------------
% 				Set rev = 1 to set to inv-quantsation mode
% 				idata is the input matrix of 8 x 8 and ratio is the quality level 
%				of quantiser used previously odata is the non linaraly quantsied 
%				output
% 				----------------------
% Input			: idata (input matrix)
% 				: ratio (Quality ratio)
%				: rev 	(1=inv-quantisation, 0=quantisation)
%
% Output	    : odata (output data - quantised/inverse quantised samples)
%				  rate - number of zeros (after quantisation)
%=================================================================================
function [odata,rate] = NL_Quantizer(idata,ratio,rev)

	if (ratio < 1) || (ratio > 99)      % checking for ratio range
		disp('  ');
		disp('Quantzer ERROR : Please follow ratio range =>  0 < ratio < 100');
		disp('  ');
		return;
	end;
	[xlen,ylen] = size(idata);          % getting size of matrix
	if (xlen ~= 8) || (ylen ~= 8)       % checking for 8x8 matrix
		disp('  ');
		disp('Quantzer ERROR : 8x8 matrix needed as input.');
		disp('  ');
		return;
	end;


	odata = zeros(8 , 8);                       % initialsizing output matrix

	Q50 = [ 16  11  10  16  24  40  51  61;     % Q50 matrix
			12  12  14  19  26  58  60  55;
			14  13  16  24  40  57  69  56; 
			14  17  22  29  51  87  80  62;
			18  22  37  56  68 109 103  77;
			24  35  55  64  81 104 113  92;
			49  64  78  87 103 121 120 101;
			72  92  95  98 112 100 103  99];

	% for calculating Q marix    
	if     (ratio < 50) Q = round(Q50 * (50/ratio));        % for Q < 50    
	elseif (ratio > 52) Q = round(Q50 * (100 - ratio)/50);  % for Q > 50
	else                Q = Q50;  end;                      % for Q = 50
		

	if (rev == 0)   % for qunatizing
		Q(Q >=256) = 255;                       % thresholding Q matrix
		odata = round(idata./Q);                % quantizing idata
		rate = sum(sum(odata == 0));       % counting zeros(data loss)
	else            % for inv-qunatizing
		odata = idata.*Q;
		rate = 0;
	end;




