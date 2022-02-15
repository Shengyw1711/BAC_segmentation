f=imread('C:/Users/samwu/Desktop/sample/line_strengthed/line_strengthed_052.jpg');
figure,imshow(f);

g1=imadjust(f, [0 1], [1 0]);
figure,imshow(g1);

g2=imadjust(f, [0.05 0.07], [0 1]);
figure,imshow(g2);

g3=imadjust(f, [ ], [ ], 5.5);
figure,imshow(g3);

imwrite(g2,'C:/Users/samwu/Desktop/sample/thresholded_line_strengthed/thresholded_line_strengthed_052.jpg');