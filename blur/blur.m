clc, clear, close all
img_origin=imread('resized_img_00260.jpg');%?取?片文件
img_gray=img_origin;%灰階化
Sigma=1.5;%σ?高斯模糊半徑，半徑越大模糊程度越大

for x = 1: 3  % 垂直方向
    for y = 1:3  % 水平方向
        WeightMatrix(x, y)=exp(-((x-1)^2+(y-1)^2)/(2*Sigma^2))/(2*pi*Sigma^2);
    end
end

WeightMatrix=WeightMatrix./sum(sum(WeightMatrix)) 
[row, col] = size( img_gray );

for i = 1: row  % 垂直方向
    for j = 1:col  % 水平方向 
        if i==1 || j==1 || i==row || j==col
            img_undist(i, j)=img_gray(i, j);
        else
            miniMatrix=single(img_gray(i-1:i+1, j-1:j+1));
            img_undist(i, j)=sum(sum( miniMatrix.*WeightMatrix ));%高斯模糊
        end
    end
end

figure(1);
subplot(1,2,1);
imshow(img_gray);%?示灰度?

subplot(1,2,2);
imshow(img_undist);%表示灰階模糊

imwrite(img_undist,'blur_img_00260.jpg');
