% ================================================================================
% Advanced Multimedia Applications
% Title 	  : AC-Huffman Decode tables (detableAC2.m)
% Description : AC Huffman coefficients of Luminance (table used for Decoding)
%				  Tables taken from [R.C Gonzalez, R.E Woods - "Digital Image
% 				  Processing, Prentice Hall(2008)]
% input       : Codeword
% output      : [Runlength (length of zeros), Category]
% ================================================================================
function O=detableAC2(basecode)
    run=0;
    category=0;
    basecode= num2str(basecode);

    %%%%%%%%%zero%%%%%%%%%%
    if strcmp(basecode,'1010')==1
        run=0;  category=0;
    elseif strcmp(basecode,'00')==1
        run=0;    category=1;
    elseif strcmp(basecode,'01')==1
        run=0;  category=2;
    elseif strcmp(basecode,'100')==1
        run=0;  category=3;
    elseif strcmp(basecode,'1011')==1
        run=0;  category=4;
    elseif strcmp(basecode,'11010')==1
        run=0;  category=5;
    elseif strcmp(basecode,'111000')==1
        run=0;  category=6;
    elseif strcmp(basecode,'1111000')==1
        run=0;  category=7;
    elseif strcmp(basecode,'1111110110')==1
        run=0;  category=8;
    elseif strcmp(basecode,'1111111110000010')==1
        run=0;  category=9;
    elseif strcmp(basecode,'1111111110000011')==1
        run=0;  category=10;

    %%%%%%%ones%%%%%%%%%%
    elseif strcmp(basecode,'1100')==1
        run=1;  category=1;
    elseif strcmp(basecode,'111001')==1
        run=1;  category=2;
    elseif strcmp(basecode,'1111001')==1
        run=1;  category=3;
    elseif strcmp(basecode,'111110110')==1
        run=1;  category=4;
    elseif strcmp(basecode,'1111111010')==1
        run=1;  category=5;
    elseif strcmp(basecode,'1111111110000100')==1
        run=1;  category=6;
    elseif strcmp(basecode,'1111111110000101')==1
        run=1;  category=7;
    elseif strcmp(basecode,'1111111110000110')==1
        run=1;  category=8;
    elseif strcmp(basecode,'1111111110000111')==1
        run=1;  category=9;
    elseif strcmp(basecode,'1111111110001000')==1
        run=1;  category=10;

    %%%%%%%twos%%%%%%%%%%
    elseif strcmp(basecode,'11011')==1
        run=2;  category=1;
    elseif strcmp(basecode,'11111000')==1
        run=2;  category=2;
    elseif strcmp(basecode,'1111110111')==1
        run=2;  category=3;
    elseif strcmp(basecode,'1111111110001001')==1
        run=2;  category=4;
    elseif strcmp(basecode,'1111111110001010')==1
        run=2;  category=5;
    elseif strcmp(basecode,'1111111110001011')==1
        run=2;  category=6;
    elseif strcmp(basecode,'1111111110001100')==1
        run=2;  category=7;
    elseif strcmp(basecode,'1111111110001101')==1
        run=2;  category=8;
    elseif strcmp(basecode,'1111111110001110')==1
        run=2;  category=9;
    elseif strcmp(basecode,'1111111110001111')==1
        run=2;  category=10;

    %%%%%%%threes%%%%%%%%%%
    elseif strcmp(basecode,'111010')==1
        run=3;  category=1;
    elseif strcmp(basecode,'111110111')==1
        run=3;  category=2;
    elseif strcmp(basecode,'11111110111')==1
        run=3;  category=3;
    elseif strcmp(basecode,'1111111110010000')==1
        run=3;  category=4;
    elseif strcmp(basecode,'1111111110010001')==1
        run=3;  category=5;
    elseif strcmp(basecode,'1111111110010010')==1
        run=3;  category=6;
    elseif strcmp(basecode,'1111111110010011')==1
        run=3;  category=7;
    elseif strcmp(basecode,'1111111110010100')==1
        run=3;  category=8;
    elseif strcmp(basecode,'1111111110010101')==1
        run=3;  category=9;
    elseif strcmp(basecode,'1111111110010110')==1
        run=3;  category=10;

    %%%%%%%fours%%%%%%%%%%
    elseif strcmp(basecode,'111011')==1
        run=4;  category=1;
    elseif strcmp(basecode,'1111111000')==1
        run=4;  category=2;
    elseif strcmp(basecode,'1111111110010111')==1
        run=4;  category=3;
    elseif strcmp(basecode,'1111111110011000')==1
        run=4;  category=4;
    elseif strcmp(basecode,'1111111110011001')==1
        run=4;  category=5;
    elseif strcmp(basecode,'1111111110011010')==1 %%%
        run=4;  category=6;
    elseif strcmp(basecode,'1111111110011011')==1
        run=4;  category=7;
    elseif strcmp(basecode,'1111111110011100')==1 %%%
        run=4;  category=8;
    elseif strcmp(basecode,'1111111110011101')==1
        run=4;  category=9;
    elseif strcmp(basecode,'1111111110011110')==1
        run=4;  category=10;

    %%%%%%%fives%%%%%%%%%%
    elseif strcmp(basecode,'1111010')==1
        run=5;  category=1;
    elseif strcmp(basecode,'1111111001')==1
        run=5;  category=2;
    elseif strcmp(basecode,'1111111110011111')==1
        run=5; category=3;
    elseif strcmp(basecode,'1111111110100000')==1
        run=5;  category=4;
    elseif strcmp(basecode,'1111111110100001')==1
        run=5;  category=5;
    elseif strcmp(basecode,'1111111110100010')==1
        run=5;  category=6;
    elseif strcmp(basecode,'1111111110100011')==1
        run=5;  category=7;
    elseif strcmp(basecode,'1111111110100100')==1
        run=5;  category=8;
    elseif strcmp(basecode,'1111111110100101')==1
        run=5;  category=9;
    elseif strcmp(basecode,'1111111110100110')==1
        run=5;  category=10;

    %%%%%%%sixes%%%%%%%%%%
    elseif strcmp(basecode,'1111011')==1
        run=6;  category=1;
    elseif strcmp(basecode,'11111111000')==1
        run=6;  category=2;
    elseif strcmp(basecode,'1111111110100111')==1
        run=6;  category=3;
    elseif strcmp(basecode,'1111111110101000')==1
        run=6;  category=4;
    elseif strcmp(basecode,'1111111110101001')==1
        run=6;  category=5;
    elseif strcmp(basecode,'1111111110101010')==1
        run=6;  category=6;
    elseif strcmp(basecode,'1111111110101011')==1
        run=6;  category=7;
    elseif strcmp(basecode,'1111111110101100')==1
        run=6;  category=8;
    elseif strcmp(basecode,'1111111110101101')==1
        run=6;  category=9;
    elseif strcmp(basecode,'1111111110101110')==1
        run=6;  category=10;

    %%%%%%%sevens%%%%%%%%%%
    elseif strcmp(basecode,'11111001')==1
        run=7;  category=1;
    elseif strcmp(basecode,'11111111001')==1
        run=7;  category=2;
    elseif strcmp(basecode,'1111111110101111')==1
        run=7;  category=3;
    elseif strcmp(basecode,'1111111110110000')==1
        run=7;  category=4;
    elseif strcmp(basecode,'1111111110110001')==1
        run=7;  category=5;
    elseif strcmp(basecode,'1111111110110010')==1
        run=7;  category=6;
    elseif strcmp(basecode,'1111111110110011')==1
        run=7;  category=7;
    elseif strcmp(basecode,'1111111110110100')==1
        run=7;  category=8;
    elseif strcmp(basecode,'1111111110110101')==1 %%%%
        run=7;  category=9;
    elseif strcmp(basecode,'1111111110110110')==1
        run=7;  category=10;

    %%%%%%%eights%%%%%%%%%%
    elseif strcmp(basecode,'11111010')==1
        run=8;  category=1;
    elseif strcmp(basecode,'111111111000000')==1
        run=8;  category=2;
    elseif strcmp(basecode,'1111111101110111')==1
        run=8;  category=3;
    elseif strcmp(basecode,'1111111110111000')==1
        run=8;  category=4;
    elseif strcmp(basecode,'1111111110111001')==1
        run=8;  category=5;
    elseif strcmp(basecode,'1111111110111010')==1
        run=8;  category=6;
    elseif strcmp(basecode,'1111111110111011')==1
        run=8;  category=7;
    elseif strcmp(basecode,'1111111110111100')==1
        run=8;  category=8;
    elseif strcmp(basecode,'1111111110111101')==1
        run=8;  category=9;
    elseif strcmp(basecode,'1111111110111110')==1 %%%
        run=8;  category=10;

    %%%%%%%nines%%%%%%%%%%
    elseif strcmp(basecode,'111111000')==1
        run=9;  category=1;
    elseif strcmp(basecode,'1111111110111111')==1
        run=9;  category=2;
    elseif strcmp(basecode,'1111111111000000')==1
        run=9;  category=3;
    elseif strcmp(basecode,'1111111111000001')==1
        run=9;  category=4;
    elseif strcmp(basecode,'1111111111000010')==1
        run=9;  category=5;
    elseif strcmp(basecode,'1111111111000011')==1
        run=9;  category=6;
    elseif strcmp(basecode,'1111111111000100')==1
        run=9;  category=7;
    elseif strcmp(basecode,'1111111111000101')==1
        run=9;  category=8;
    elseif strcmp(basecode,'1111111111000110')==1
        run=9;  category=9;
    elseif strcmp(basecode,'1111111111000111')==1
        run=9;  category=10;

    %%%%%%%tens%%%%%%%%%%
    elseif strcmp(basecode,'111111001')==1
        run=10;  category=1;
    elseif strcmp(basecode,'1111111111001000')==1
        run=10;  category=2;
    elseif strcmp(basecode,'1111111111001001')==1
        run=10;  category=3;
    elseif strcmp(basecode,'1111111111001010')==1
        run=10;  category=4;
    elseif strcmp(basecode,'1111111111001011')==1
        run=10;  category=5;
    elseif strcmp(basecode,'1111111111001100')==1
        run=10;  category=6;
    elseif strcmp(basecode,'1111111111001101')==1
        run=10;  category=7;
    elseif strcmp(basecode,'1111111111001110')==1
        run=10;  category=8;
    elseif strcmp(basecode,'1111111111001111')==1
        run=10;  category=9;
    elseif strcmp(basecode,'1111111111010000')==1
        run=10;  category=10;

    %%%%%%%elevens%%%%%%%%%%
    elseif strcmp(basecode,'111111010')==1
        run=11;  category=1;
    elseif strcmp(basecode,'1111111111010001')==1
        run=11;  category=2;
    elseif strcmp(basecode,'1111111111010010')==1
        run=11;  category=3;
    elseif strcmp(basecode,'1111111111010011')==1
        run=11;  category=4;
    elseif strcmp(basecode,'1111111111010100')==1
        run=11;  category=5;
    elseif strcmp(basecode,'1111111111010101')==1
        run=11;  category=6;
    elseif strcmp(basecode,'1111111111010110')==1
        run=11;  category=7;
    elseif strcmp(basecode,'1111111111010111')==1
        run=11;  category=8;
    elseif strcmp(basecode,'1111111111011000')==1
        run=11;  category=9;
    elseif strcmp(basecode,'1111111111011001')==1
        run=11;  category=10;

    %%%%%%%twelevs%%%%%%%%%%
    elseif strcmp(basecode,'11111111111111110')==1 %%%
        run=12;  category=1;
    elseif strcmp(basecode,'1111111111011010')==1
        run=12;  category=2;
    elseif strcmp(basecode,'1111111111011011')==1
        run=12;  category=3;
    elseif strcmp(basecode,'1111111111011100')==1
        run=12;  category=4;
    elseif strcmp(basecode,'1111111111011101')==1
        run=12;  category=5;
    elseif strcmp(basecode,'111111111101110')==1
        run=12;  category=6;
    elseif strcmp(basecode,'1111111111011111')==1
        run=12;  category=7;
    elseif strcmp(basecode,'1111111111100000')==1 %%%
        run=12;  category=8;
    elseif strcmp(basecode,'1111111111100001')==1
        run=12;  category=9;
    elseif strcmp(basecode,'1111111111100010')==1
        run=12;  category=10;

    %%%%%%%13s%%%%%%%%%%
    elseif strcmp(basecode,'11111111010')==1
        run=13;  category=1;
    elseif strcmp(basecode,'1111111111100011')==1
        run=13; category=2;
    elseif strcmp(basecode,'1111111111100100')==1
        run=13;  category=3;
    elseif strcmp(basecode,'1111111111100101')==1
        run=13;  category=4;
    elseif strcmp(basecode,'1111111111100110')==1
        run=13;  category=5;
    elseif strcmp(basecode,'1111111111100111')==1
        run=13;  category=6;
    elseif strcmp(basecode,'1111111111101000')==1
        run=13;  category=7;
    elseif strcmp(basecode,'1111111111101001')==1
        run=13;  category=8;
    elseif strcmp(basecode,'1111111111101010')==1
        run=13;  category=9;
    elseif strcmp(basecode,'1111111111101011')==1
        run=13;  category=10;

    %%%%%%%14s%%%%%%%%%%
    elseif strcmp(basecode,'111111110110')==1
        run=14;  category=1;
    elseif strcmp(basecode,'1111111111101100')==1
        run=14;  category=2;
    elseif strcmp(basecode,'1111111111101101')==1
        run=14;  category=3;
    elseif strcmp(basecode,'1111111111101110')==1
        run=14;  category=4;
    elseif strcmp(basecode,'1111111111101111')==1
        run=14;  category=5;
    elseif strcmp(basecode,'1111111111110000')==1 %%%
        run=14;  category=6;
    elseif strcmp(basecode,'1111111111110001')==1 %%%
        run=14;  category=7;
    elseif strcmp(basecode,'1111111111110010')==1
        run=14;  category=8;
    elseif strcmp(basecode,'1111111111110011')==1
        run=14;  category=9;
    elseif strcmp(basecode,'1111111111110100')==1 %%%
        run=14; category=10;

    %%%%%%%15s%%%%%%%%%%
    elseif strcmp(basecode,'11111111111111111')==1%%%
        run=15;  category=0;
    elseif strcmp(basecode,'1111111111110101')==1
        run=15;  category=1;
    elseif strcmp(basecode,'1111111111110110')==1
        run=15;  category=2;
    elseif strcmp(basecode,'1111111111110111')==1
        run=15;  category=3;
    elseif strcmp(basecode,'1111111111111000')==1
        run=15;  category=4;
    elseif strcmp(basecode,'1111111111111001')==1
        run=15;  category=5;
    elseif strcmp(basecode,'1111111111111010')==1
        run=15;  category=6;
    elseif strcmp(basecode,'1111111111111011')==1 %%%
        run=15;  category=7;
    elseif strcmp(basecode,'1111111111111100')==1 %%%
        run=15;  category=8;
    elseif strcmp(basecode,'1111111111111101')==1 %%%
        run=15;  category=9;
    elseif strcmp(basecode,'1111111111111110')==1
        run=15;  category=10;
    else
        category=11; %if can not match with the input, return to 11
    end


    O=zeros(1,2);
    O(1,1)=run;
    O(1,2)=category;

end
