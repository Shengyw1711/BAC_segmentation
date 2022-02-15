%% load a JPEG image and perform thresholding with manual ROI
clear, close all

%% read JPED image and display with a threshold
%img=imread('C:/Users/samwu/Desktop/sample/cropped/cropped_010.jpg');
img=imread('C:/Users/samwu/Desktop/sample/thresholded_line_strengthed/thresholded_line_strengthed_010.jpg');
figure,colormap(gray(255))

subplot(1,3,1),image(img),axis off
%% perform roipoly
BW = roipoly;
subplot(1,3,2),imagesc(BW),axis off
%I = imagesc(BW);

for i=1:3
    img(:,:,i)=img(:,:,i).*uint8(BW);
    %img(:,:)=img(:,:).*uint8(BW);
end
subplot(1,3,3),image(img),axis off
%imwrite(BW,'C:/Users/samwu/Desktop/sample/ground_truth/ground_truth_010.jpg');
imwrite(BW,'C:/Users/samwu/Desktop/sample/thresholded_line_strengthed/binary/binary_010.jpg');
