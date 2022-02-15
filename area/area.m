clear,close all;
bI=imread('C:/Users/samwu/Desktop/sample/ground_truth/ground_truth_010.jpg');
%bI=imread('C:/Users/samwu/Desktop/sample/thresholded_line_strengthed/binary/binary_010.jpg');
%bI=imread('C:/Users/samwu/Desktop/sample/thresholded_line_strengthed/thresholded_line_strengthed_010.jpg');
white_area = nnz(bI);
black_area = numel(bI)-white_area;
calibrationFactor = 160/5435;
w_asqmm = white_area * calibrationFactor ^ 2;
b_asqmm = black_area * calibrationFactor ^ 2;