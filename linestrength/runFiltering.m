close all;
clear;
load ('resized_1.jpg');%get input image (real example)
%load data;%get input image (synthetic example)
% parameters of Step Filter
Step_Filter_grammes = 30; %size
Step_Filter_Dbw = [2 4]; %vector of width of main wave
Step_Filter_step = pi/12;  %angle step
Step_Filter_DTheta = [0:Step_Filter_step:pi-(Step_Filter_step)]; %angle vector
Step_Filter_type = 0; % type of step filter in {0,1} : 1 step function, 0 Polynomial filter
grammes = Step_Filter_grammes;
Dbw = Step_Filter_Dbw;
DTheta = Step_Filter_DTheta;
I=imread('resized_1.jpg');


[Y]= step_pol_Filtering(I,grammes,DTheta,Dbw,Step_Filter_type);
figure;
imagesc(I),title('Data ');
colormap('gray');
figure;
h=imagesc(Y);
title('Filter output');
colormap('gray');
cm = colormap(h.Parent);
n = size(cm,1);
c = linspace(h.Parent.CLim(1),h.Parent.CLim(2),n); 
ind = reshape(interp1(c,1:n,Y(:),'nearest'),size(Y));
rgb = ind2rgb(ind,cm);
figure;
imshow(rgb,'InitialMagnification','fit');
title('rgb image');
imwrite(rgb,'line_strengthed_1.jpg');

