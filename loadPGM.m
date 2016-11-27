%=================================================================================
% Advanced Multimedia Applications
% Title      : Load PGM Image (loadPGM.m)
% Description: Returns a matrix containing the image loaded from the PGM format
%			   file filename.  Handles ASCII (P2) and binary (P5) PGM file formats.
%
%			   If the filename has no extension, and open fails, a '.pgm' will
%			   be appended.
%
%			   Copyright (c) Peter Corke, 1999  Machine Vision Toolbox for Matlab
% 			   Adapted from - Peter Corke 1994
% Input		: filename (image path)
% Output	: I		 - data samples from image
%			  rows   - number of rows
%			  cols   - number of columns
%			  maxlum - maximum luminance value
%=================================================================================
function [I,rows,cols,maxlum] = loadPGM(filename)
	
    % define whitespaces
    white = [' ' 9 10 13];	% space, tab, lf, cr
	white = char(white);
    
	fid = fopen(filename, 'r');
	
    % check if file exists
    if fid < 0,
		fid = fopen([filename '.pgm'], 'r');
    end
    
	if fid < 0,
		error('Couldn''t open file');
    end
	
    % -- start the header extraction --    
    
    % <magic number>
	magic = fread(fid, 2, 'char');  % read in magic number (assume 2 chars)
	while 1
		c = fread(fid,1,'char');
		if c == '#',
			fgetl(fid); % ignore comment line
		elseif ~any(c == white)
			fseek(fid, -1, 'cof');	% go back one char
			break;
		end
    end
    
    % <number of columns>
	cols = fscanf(fid, '%d', 1);    % read in columns (integer)
	while 1
		c = fread(fid,1,'char');
		if c == '#',
			fgetl(fid);  % ignore comment line
		elseif ~any(c == white)
			fseek(fid, -1, 'cof');	% go back one char
			break;
		end
    end
        
    % <number of rows>
	rows = fscanf(fid, '%d', 1);    % read in rows (integer)
	while 1
		c = fread(fid,1,'char');
		if c == '#',
			fgetl(fid);  % ignore comment line
		elseif ~any(c == white)
			fseek(fid, -1, 'cof');	% go back one char
			break;
		end
    end
    
    % <max luminance value>
	maxlum = fscanf(fid, '%d', 1);  % read in max grey (integer)
	while 1
		c = fread(fid,1,'char');
		if c == '#',
			fgetl(fid);  % ignore comment line
		elseif ~any(c == white)
			fseek(fid, -1, 'cof');	% go back one char
			break;
		end
    end
    
    
    % check magic number to see which pgm version this is
    % throw error if different format
	if magic(1) == 'P',
		if magic(2) == '2',
			%disp(['ASCII PGM file ' num2str(rows) ' x ' num2str(cols)])
			I = fscanf(fid, '%d', [cols rows])';
		elseif magic(2) == '5',
			%disp(['Binary PGM file ' num2str(rows) ' x ' num2str(cols)])
			if maxlum == 1,
				fmt = 'unint1';
			elseif maxlum == 15,
				fmt = 'uint4';
			elseif maxlum == 255,
				fmt = 'uint8';
			elseif maxlum == 2^32-1,
				fmt = 'uint32';
			end
			I = fread(fid, [cols rows], fmt)';
		else
			disp('Not a PGM file');
		end
    end

    fclose(fid);    % close file