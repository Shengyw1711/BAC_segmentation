close all;
clear;
I = imread('line_strengthed_1.jpg');
% ��l�Ʀǫת����
H = zeros(256);

% �p��ǫת����
[l, w] = size(I);
for r = 1:l
    for c = 1:w
        index = I(r, c) + 1;      
        H(index) = H(index) + 1;
    end
end
% ��ܦǫת����
figure;
hist = bar(0:255, H, 'histc');
max = 40;
% �H��
index = 40;

sum = 0;
for j = 1:256
    sum = sum + j * H(j);
end
n_pixels = l * w;
n_current_pixels = 0;
average_gray_value = 0;
% �M��̤j������t
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