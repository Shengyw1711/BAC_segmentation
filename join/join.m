close all;
clear;
 A = imread('split_img_1.jpg');%?�J?��1.jpg
 B = imread('split_img_2.jpg');%?�J?��2.jpg
 C = imread('split_img_3.jpg');
 D = imread('split_img_4.jpg');
 E = imread('region_grow_img_5.jpg');
 F = imread('region_grow_img_6.jpg');
 G = [ A,B,C
       D,E,F];%����?��
 figure,imshow(G);%�i��?���]�D���ݡ^
 imwrite(G,'region_grow_img.jpg');%�O�s?���A�R�W?3.jpg