% =================================================================================
% Advanced Multimedia Applications
% Title 	  : Fast-1D-DCT (fdct_1.m)
% Description : Fast 1D-DCT - using buttefly graph given in
%				"Standard Coecs - by Ghanbari"
% Input       : data samples (array)
% Output	  : DCT-coefficients (array)
% =================================================================================
function fdct_result = fdct_1(p)
	
	% verify if length is 8, can't do for any other size
    if(length(p)~=8)
        error('input data samples is not = 8');
    end    
    
    % pre-calculating the sine and cosine values (for speed)
    cos_pi_4        =  0.707106781186548;
    neg_cos_pi_4    = -0.707106781186548;
    sin_pi_8        =  0.382683432365090;
    cos_pi_8        =  0.923879532511287;
    neg_sin_3pi_8   = -0.923879532511287;
    cos_3pi_8       =  0.382683432365090;
    sin_pi_16       =  0.195090322016128;
    cos_pi_16       =  0.980785280403230;
    cos_3pi_16      =  0.831469612302545;
    neg_sin_3pi_16  = -0.555570233019602;
    sin_5pi_16      =  0.831469612302545;
    cos_5pi_16      =  0.555570233019602;
    neg_sin_7pi_16  = -0.980785280403230;
    cos_7pi_16      =  0.195090322016128;
       
    % preallocation
    s = [0 0 0 0 0 0 0 0];
    t = [0 0 0 0 0 0 0 0];
    r = [0 0 0 0 0 0 0 0];
    c = [0 0 0 0 0 0 0 0];    
    
    % first stage
    s(1) = p(1) + p(8);
    s(2) = p(2) + p(7);
    s(3) = p(3) + p(6);
    s(4) = p(4) + p(5);
    s(5) = p(4) - p(5);
    s(6) = p(3) - p(6);
    s(7) = p(2) - p(7);
    s(8) = p(1) - p(8);

    % second stage
    t(6) = (s(6)*(neg_cos_pi_4)) + (s(7)*cos_pi_4);
    t(7) = (s(6)*cos_pi_4)       + (s(7)*cos_pi_4);

    % third stage
    r(1) = s(1) + s(4);
    r(2) = s(2) + s(3);
    r(3) = s(2) - s(3);
    r(4) = s(1) - s(4);    
    r(5) = s(5) + t(6);
    r(6) = s(5) - t(6);
    r(7) = s(8) - t(7);
    r(8) = s(8) + t(7);

    % fourth stage
    c(1) = (r(1)*cos_pi_4)      + (r(2)*cos_pi_4);
    c(5) = (r(1)*cos_pi_4)      + (r(2)*neg_cos_pi_4);
    c(3) = (r(3)*sin_pi_8)      + (r(4)*cos_pi_8);    
    c(7) = (r(3)*neg_sin_3pi_8) + (r(4)*cos_3pi_8);
    c(2) = (r(5)*sin_pi_16)     + (r(8)*cos_pi_16);
    c(4) = (r(6)*neg_sin_3pi_16)+ (r(7)*cos_3pi_16);
    c(6) = (r(6)*sin_5pi_16)    + (r(7)*cos_5pi_16);    
    c(8) = (r(5)*neg_sin_7pi_16)+ (r(8)*cos_7pi_16);
	
	% scaling performed (to match the simple dct)
    fdct_result = c/2;
    