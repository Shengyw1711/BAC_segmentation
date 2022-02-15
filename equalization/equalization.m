f=imread('split_img_6.jpg');
figure,imhist(f)
imshow(f)
ylim('auto')
g = histeq(f,256);%直方?均衡化
figure , imshow(g)
figure , imhist(g)%?示直方?
ylim('auto')
%imwrite(g,'C:/Users/samwu/Desktop/sample/equalization_018.jpg');