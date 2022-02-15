close all;
clear;

I = imread('line_strengthed_1.jpg');
level = graythresh(I)
level = 0.06
BW = imbinarize(I,level);
imshowpair(I,BW,'montage')
imwrite(BW,'thresholded_1.jpg');