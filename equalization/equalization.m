f=imread('split_img_6.jpg');
figure,imhist(f)
imshow(f)
ylim('auto')
g = histeq(f,256);%����?���Ť�
figure , imshow(g)
figure , imhist(g)%?�ܪ���?
ylim('auto')
%imwrite(g,'C:/Users/samwu/Desktop/sample/equalization_018.jpg');