%=================================================================================
% Advanced Multimedia Applications
% Title 	  : ZigZag Encoder (zigzag_e.m)
% Description : Zig-zag encoder for matrixs
% 				usage =>     optdata = zigzag_e(inpdata); 
% 				The function scans the input data(inpdata) in zig-zag format and 
%				returns it as a matrix of same dimention
%
% Input		  : (matrix)
% Outout 	  : Inverse-Zigzag (matrix)
%================================================================================= 
function [zig_data] = zigzag_e(idata)
%%
%% Zig-zag encoder for matrixs
%%
%%
%% usage =>     optdata = zigzag_e(inpdata);
%% 
%% The function scans the input data(inpdata) in zig-zag format and returns
%% it as a matrix of same dimention
%%

[xlen,ylen] = size(idata);      % getting size of matrix
if xlen ~= ylen                 % checking for square matrix
    disp('  ');
    disp('Zig-Zag encoder ERROR : Square matrix needed as input.');
    disp('  ');
    return;
end;

count = 1; x = 1; y = 1;        % initalising counter variables
zig_data = zeros(xlen , ylen);  % initialising output matrix
zig_data(1,1) = idata(1,1);  

% Top half ---------------
while (1)
    y=y+1;
    
    count = count + 1;          % data logger
    zig_data(fix(((count-1)/xlen)+1),count-((fix((count-1)/xlen)*xlen))) =...
																		idata(x,y);
    
    while(y~=1) % to loop till reaching the top edge(for moving diagonally up)
        x=x+1;
        y=y-1;
        
        count = count + 1;      % data logger
        zig_data(fix(((count-1)/xlen)+1),count-((fix((count-1)/xlen)*xlen))) =...
																		idata(x,y);
    
    end
    x=x+1;
    if(x>xlen)  % to detect the end of top half
        x=x-1;  
        break;  
    end;
    
    count = count + 1;          % data logger
    zig_data(fix(((count-1)/xlen)+1),count-((fix((count-1)/xlen)*xlen))) =...
																		idata(x,y);
    
    while(x~=1)  % to loop till reaching the left edge(for moving diagonally down)
        x=x-1;  
        y=y+1;  
        
        count = count + 1;      % data logger
        zig_data(fix(((count-1)/xlen)+1),count-((fix((count-1)/xlen)*xlen))) =...
																		idata(x,y);
    
    end;  
end;

% bottom half -----------
while(1)
    y=y+1; 
    
    count = count + 1;          % data logger
    zig_data(fix(((count-1)/xlen)+1),count-((fix((count-1)/xlen)*xlen))) =...
																		idata(x,y);
     % to loop till reaching the bottom edge(for moving diagonally down)
    while(y~=ylen) 
        y=y+1;  
        x=x-1; 
        
        count = count + 1;      % data logger
        zig_data(fix(((count-1)/xlen)+1),count-((fix((count-1)/xlen)*xlen))) =...
																		idata(x,y);
  
    end;
    x=x+1;  
    if(x>xlen)  % to detect end of bottom half
        x=x-1;  
        break;  
    end;
    
    count = count + 1;          % data logger
    zig_data(fix(((count-1)/xlen)+1),count-((fix((count-1)/xlen)*xlen))) =...
																		idata(x,y);
    
    while(x~=xlen)  % to loop till reaching the right edge(for moving diagonally up)
        x=x+1;
        y=y-1;
        
        count = count + 1;      % data logger
        zig_data(fix(((count-1)/xlen)+1),count-((fix((count-1)/xlen)*xlen))) =...
																		idata(x,y);
    
    end;
end;