% =================================================================================
% Advanced Multimedia Applications
% Title 	  : Fast-1D-IDCT (fidct_1.m)
% Description : Fast 1D-IDCT(Inverse) - using buttefly graph given in
%				"Standard Coecs - by Ghanbari"
% Input       : dct coefficients (array)
% Output	  : inverse-dct results (array)	
% =================================================================================
function fidct_result = fidct_1(c)
	
	% verify if length is 8, can't do for any other size
    if(length(c)~=8)
        error('input data samples is not = 8');
    end    
        
    % pre-calculating the sine and cosine values (for speed?)
    sin_pi_16   = 0.195090322016128;
    cos_pi_16   = 0.980785280403230;
    cos_3pi_16  = 0.831469612302545;
    sin_3pi_16  = 0.555570233019602;
    sin_5pi_16  = 0.831469612302545;
    cos_5pi_16  = 0.555570233019602;
    sin_7pi_16  = 0.980785280403230;
    cos_7pi_16  = 0.195090322016128;
        
    % working backwards from the FDCT stages (rescale)
    c = c*2;    
    
    % first stage
	% equations pre calculated using symbol maths in matlab
    r(1) = (2^(1/2)*(c(1) + c(5)))/2;
    r(2) = (2^(1/2)*(c(1) - c(5)))/2;
    r(3) = (c(3)*(2 - 2^(1/2))^(1/2))/2 - (c(7)*(2^(1/2) + 2)^(1/2))/2;
    r(4) = (c(7)*(2 - 2^(1/2))^(1/2))/2 + (c(3)*(2^(1/2) + 2)^(1/2))/2;
    r(5) = (c(2)*cos_7pi_16 - c(8)*cos_pi_16)/(cos_pi_16*sin_7pi_16 +...
													cos_7pi_16*sin_pi_16); 
    r(6) = -(c(4)*cos_5pi_16 - c(6)*cos_3pi_16)/(cos_3pi_16*sin_5pi_16 +...
												    cos_5pi_16*sin_3pi_16);
    r(7) = (c(4)*sin_5pi_16 + c(6)*sin_3pi_16)/(cos_3pi_16*sin_5pi_16 +...
													cos_5pi_16*sin_3pi_16);
    r(8) = (c(2)*sin_7pi_16 + c(8)*sin_pi_16)/(cos_pi_16*sin_7pi_16 +...
													cos_7pi_16*sin_pi_16);
        
    % second stage    (skipped t1-t4)
    t(5) = r(5)/2 + r(6)/2;
    t(6) = r(5)/2 - r(6)/2;
    t(7) = r(8)/2 - r(7)/2;
    t(8) = r(7)/2 + r(8)/2;
	
    
    % third stage
    s(1) = r(1)/2 + r(4)/2;
    s(2) = r(2)/2 + r(3)/2;
    s(3) = r(2)/2 - r(3)/2;
    s(4) = r(1)/2 - r(4)/2;
    s(6) = -(2^(1/2)*(t(6) - t(7)))/2;
    s(7) = (2^(1/2)*(t(6) + t(7)))/2;

    % fourth stage
    p(1) = s(1)/2 + t(8)/2;
    p(2) = s(2)/2 + s(7)/2;
    p(3) = s(3)/2 + s(6)/2;
    p(4) = s(4)/2 + t(5)/2;
    p(5) = s(4)/2 - t(5)/2;
    p(6) = s(3)/2 - s(6)/2;
    p(7) = s(2)/2 - s(7)/2;
    p(8) = s(1)/2 - t(8)/2;
    
	% round the result to the nearest integer
    fidct_result = round(p);
    