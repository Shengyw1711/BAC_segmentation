close all;
clear;
I = imread('line_strengthed_1.jpg');
% 初始化灰度直方圖
H = zeros(256);

% 計算灰度直方圖
[l, w] = size(I);
for r = 1:l
    for c = 1:w
        index = I(r, c) + 1;      
        H(index) = H(index) + 1;
    end
end
% 顯示灰度直方圖
figure;
hist = bar(0:255, H, 'histc');
max = 40;
% 閾值
index = 40;

sum = 0;
for j = 1:256
    sum = sum + j * H(j);
end
n_pixels = l * w;
n_current_pixels = 0;
average_gray_value = 0;
% 尋找最大類間方差
for i = 1:255
    gray_value = i * H(i)  + average_gray_value * n_current_pixels ;
    n_current_pixels = n_current_pixels + H(i); 
    average_gray_value  = gray_value / n_current_pixels;
    average_gray_value2 = (sum-gray_value)/(n_pixels - n_current_pixels)
    s = n_current_pixels * (n_pixels - n_current_pixels) / n_pixels^2  * (average_gray_value-average_gray_value2)^2;
    if (s > max)
        max = s;
        index = i;
    end
end
th = index
I2 = zeros(size(I));
I2 (find(I>=th)) = 255;
I2 (find(I<th)) = 0;
figure;
imshow(I2)
imwrite(I2,'thresholded_line_strengthed_1.jpg');