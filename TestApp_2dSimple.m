% test app for 2D-DCT (simple method)


clc;clear

datasize = 4;

img = imread('lena512.bmp');
%img = imread('Cameraman.bmp');

data = img;
%data = round(-128 + (128+128).*rand(datasize))

img = double(img)-128;


dct_2_s = dct_2_simple(data);

imshow(dct_2_s)


%dct2 = dct2(data);

idct_2_s = idct_2_simple(dct_2_s);