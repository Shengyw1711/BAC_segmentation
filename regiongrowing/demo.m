close all;
clear;
I=imread('split_img_00260_2.jpg');
I=im2double(I);
I=rgb2gray(I);
I=imresize(I,0.5);
figure,imshow(I);
hold on;
[y x]=getpts;
n=length(x);
hold off;
J=zeros(10,10);
for i=1:n-1 
    x(i)=round(x(i));
    y(i)=round(y(i));
J = regiongrowing(I,x(i),y(i),0.1); 
 figure,imshow(J);
end
figure,imshow(J);
J=imresize(J,2);
imwrite(J,'region_grow_img_00260_2.jpg')