%% load a JPEG image and perform thresholding with manual ROI
clear, close all

%% read JPED image and display with a threshold
img=imread('resized_1.jpg');

img=im2uint8(img);

figure,colormap(gray(255))

subplot(1,3,1),image(img),axis off
%% perform roipoly
BW = roipoly;
subplot(1,3,2),imagesc(BW),axis off

for i=1:3
    img(:,:)=img(:,:).*uint8(BW);
end
subplot(1,3,3),image(img),axis off

imwrite(img,'result_1.jpg');
