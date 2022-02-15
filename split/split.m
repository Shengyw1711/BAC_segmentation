close all;
clear;
I = imread('clear_thresholded_line_strengthed_img_00260.jpg');
rows = 2; % define how many rows of block
cols = 3; % define how many cols of block
sizeI = size(I);
blocks = mat2tiles(I, ceil(sizeI(1:2)./[rows cols]))';
for i = 1:rows*cols
  subplot(rows, cols, i);
  imshow(blocks{i});
end
imwrite(blocks{1},'split_img_00260_1.jpg')
imwrite(blocks{2},'split_img_00260_2.jpg')
imwrite(blocks{3},'split_img_00260_3.jpg')
imwrite(blocks{4},'split_img_00260_4.jpg')
imwrite(blocks{5},'split_img_00260_5.jpg')
imwrite(blocks{6},'split_img_00260_6.jpg')