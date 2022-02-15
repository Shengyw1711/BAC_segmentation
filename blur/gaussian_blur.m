clc, clear, close all
img_origin=imread('resized_img_00260.jpg');%??ゅン
img_gray=img_origin;%ηて
Sigma=1.5;%?蔼吹家絢??禫家絢祘禫

for x = 1: 3  % よ
    for y = 1:3  % キよ
        WeightMatrix(x, y)=exp(-((x-1)^2+(y-1)^2)/(2*Sigma^2))/(2*pi*Sigma^2);
    end
end

WeightMatrix=WeightMatrix./sum(sum(WeightMatrix)) %ㄏ?3*3痻?ぇ㎝单1
[row, col] = size( img_gray );

for i = 1: row  % よ
    for j = 1:col  % キよ 
        if i==1 || j==1 || i==row || j==col
            img_undist(i, j)=img_gray(i, j);%??ゼ?瞶
        else
            miniMatrix=single(img_gray(i-1:i+1, j-1:j+1));
            img_undist(i, j)=sum(sum( miniMatrix.*WeightMatrix ));%蔼吹家絢
        end
    end
end

figure(1);
subplot(1,2,1);
imshow(img_gray);%?ボη?

subplot(1,2,2);
imshow(img_undist);%?ボη家絢?

imwrite(img_undist,'blur_img_00260.jpg');