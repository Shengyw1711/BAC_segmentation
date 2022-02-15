clear all;
clc;
f=imread('C:\Users\samwu\Desktop\Matlab\CBIS-DDSM\00646\LEFT\CC\equalization_1.jpg');
[gv, t] = edge(f, 'sobel', 0.0169, 'vertical');
%imshow(gv)

gboth = edge(f, 'sobel', 0.0169);
%figure,imshow(gboth);

w45 = [-2 -1 -1; 0 0 0; 1 2 2];
g45 = imfilter(double(f), w45, 'replicate');
T = 0.3*max(abs(g45(:)));
g45 = g45 >= T;
%figure,imshow(g45);

g_sobel_best = edge(f, 'sobel', 0.025);
%figure,imshow(g_sobel_best);

g_log_best = edge(f, 'log', 0.0025, 2.15);
%figure,imshow(g_log_best);

g_canny_best = edge(f, 'canny', [0.35 0.5], 2.0);
figure,imshow(g_canny_best);