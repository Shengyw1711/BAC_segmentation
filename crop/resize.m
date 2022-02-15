clc, clear, close all
img = imread('cropped_1.jpg');
%img = imread('C:/Users/samwu/Desktop/sample/clear thresholded/170.jpg');
%resizedPic=imresize(img,[480,640],'nearest');
resizedPic=imresize(img,[4000,2100],'nearest');
%imwrite(resizedPic,'C:/Users/samwu/Desktop/sample/LV_small_RoI/170.jpg');
%imwrite(resizedPic,'C:/Users/samwu/Desktop/sample/LV_small_RoI/170.png');
imwrite(resizedPic,'resized_1.jpg');