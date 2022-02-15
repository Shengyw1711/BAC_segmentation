clc, clear, close all
img_origin=imread('resized_img_00260.jpg');%?��?�����
img_gray=img_origin;%�ǫפ�
Sigma=1.5;%�m?�����ҽk�b?�A�b?�V�j�ҽk�{�׶V�j

for x = 1: 3  % ������V
    for y = 1:3  % ������V
        WeightMatrix(x, y)=exp(-((x-1)^2+(y-1)^2)/(2*Sigma^2))/(2*pi*Sigma^2);
    end
end

WeightMatrix=WeightMatrix./sum(sum(WeightMatrix)) %��?3*3�x?���M���_1
[row, col] = size( img_gray );

for i = 1: row  % ������V
    for j = 1:col  % ������V 
        if i==1 || j==1 || i==row || j==col
            img_undist(i, j)=img_gray(i, j);%??��?�z
        else
            miniMatrix=single(img_gray(i-1:i+1, j-1:j+1));
            img_undist(i, j)=sum(sum( miniMatrix.*WeightMatrix ));%�����ҽk
        end
    end
end

figure(1);
subplot(1,2,1);
imshow(img_gray);%?�ܦǫ�?

subplot(1,2,2);
imshow(img_undist);%?�ܦǫ׼ҽk?

imwrite(img_undist,'blur_img_00260.jpg');