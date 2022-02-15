close all;
clear;
I=imread('remove_label_img_1.jpg');
I=im2uint8(I);
[J, rect] = imcrop(I);
imwrite(J,'cropped_1.jpg');