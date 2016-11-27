% ================================================================================
% Advanced Multimedia Applications
% Title		  : DC-Category Table (dc_category.m)
% Description : The Category (CAT) of the baseline encoder (DC Values)
%				  Tables taken from [R.C Gonzalez, R.E Woods - "Digital Image
% 				  Processing, Prentice Hall(2008)]
% Input  	  : Non-zero coefficient value (DC-Coeff)
% Output 	  : Amplitude
% ================================================================================
function amplen = dc_category(x)
    
    val=abs(x); % only check for (+)ve ranges
    
    if (val==0);                      amplen=0;
    elseif(val==1);                   amplen=1;
    elseif(val >=    2 & val <=    3);amplen= 2;
    elseif(val >=    4 & val <=    7);amplen= 3;
    elseif(val >=    8 & val <=   15);amplen= 4; 
    elseif(val >=   16 & val <=   31);amplen= 5;
    elseif(val >=   32 & val <=   63);amplen= 6;
    elseif(val >=   64 & val <=  127);amplen= 7;
    elseif(val >=  128 & val <=  255);amplen= 8;
    elseif(val >=  256 & val <=  511);amplen= 9;
    elseif(val >=  512 & val <= 1023);amplen=10;
    elseif(val >= 1024 & val <= 2047);amplen=11;        
    end
