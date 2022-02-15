close all;
clear;
 A = imread('split_img_1.jpg');%?入?像1.jpg
 B = imread('split_img_2.jpg');%?入?像2.jpg
 C = imread('split_img_3.jpg');
 D = imread('split_img_4.jpg');
 E = imread('region_grow_img_5.jpg');
 F = imread('region_grow_img_6.jpg');
 G = [ A,B,C
       D,E,F];%拼接?像
 figure,imshow(G);%展示?像（非必需）
 imwrite(G,'region_grow_img.jpg');%保存?像，命名?3.jpg