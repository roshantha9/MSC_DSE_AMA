% ================================================================================
% Advanced Multimedia Applications
% Title 	  : AC-Category Table (ac_category.m)	
% Description : The Category (CAT) of the baseline encoder (AC Values)
%				  Tables taken from [R.C Gonzalez, R.E Woods - "Digital Image
% 				  Processing, Prentice Hall(2008)]
% input  : AC-Coefficient amplitude
% output : Amplitude(category)
% ================================================================================
function amplen = ac_category(x)
   
    R=abs(x);   % only check for (+)ve ranges
    
    if R==1;                         amplen=1;
    elseif(R >=   2  & R <=    3);   amplen = 2;
    elseif(R >=   4  & R <=    7);   amplen = 3;
    elseif(R >=   8  & R <=   15);   amplen = 4;
    elseif(R >=  16  & R <=   31);   amplen = 5;
    elseif(R >=  32  & R <=   63);   amplen = 6;
    elseif(R >=  64  & R <=  127);   amplen = 7;
    elseif(R >= 128  & R <=  255);   amplen = 8;
    elseif(R >= 256  & R <=  511);   amplen = 9;
    elseif(R >= 512  & R <= 1023);   amplen = 10;
    elseif(R >= 1024 & R <= 2047);   amplen = 11;
    end 
