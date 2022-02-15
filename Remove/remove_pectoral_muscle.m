clc;   
close all;  
clearvars;  
workspace;  
format long g;
format compact;
fontSize = 20;

folder = 'C:\Users\samwu\Desktop\sample\removed_label';
baseFileName = '170.jpg';
%讀檔
fullFileName = fullfile(folder, baseFileName);
% 檢查檔案是否存在
if ~exist(fullFileName, 'file')
	fullFileNameOnSearchPath = baseFileName; 
	if ~exist(fullFileNameOnSearchPath, 'file')
		errorMessage = sprintf('Error: %s does not exist in the search path folders.', fullFileName);
		uiwait(warndlg(errorMessage));
		return;
	end
end
rgbImage = imread(fullFileName);
%顯示原始圖
subplot(2, 2, 1);
imshow(rgbImage, []);
title('Original Image', 'FontSize', fontSize, 'Interpreter', 'None');
hp = impixelinfo;
axis('on', 'image');


grayImage = rgbImage; 
[rows, columns, numberOfColorChannels] = size(grayImage);
if numberOfColorChannels > 1
	
	grayImage = grayImage(:, :, 1);
end

whiteFrameMask = ~bwconvhull(grayImage < 255);
grayImage(whiteFrameMask) =0;

[blackRows, blackCols] = find(grayImage ~= 0);
topRow = min(blackRows)
bottomRow = max(blackRows)
leftCol = min(blackCols)
rightCol = max(blackCols)
grayImage = grayImage(topRow:bottomRow, leftCol:rightCol);

% Display the gray scale image.
%subplot(2, 3, 3);
%imshow(grayImage, []);
%caption = sprintf('Gray Scale Image');
%title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
%hp = impixelinfo;
%axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio.
%drawnow;

% Display the histogram.
subplot(2, 2, 2);
imhist(grayImage);
grid on;
title('Histogram of Gray Scale Image', 'FontSize', fontSize, 'Interpreter', 'None');


% Turn into a binary image.
binaryImage = grayImage > 155 ;

% Extract only largest blob.
binaryImage = bwareafilt(binaryImage, 1);

% Fill holes
binaryImage = imfill(binaryImage, 'holes');

% Display the binary image.
subplot(2, 2, 3);
imshow(binaryImage, []);
caption = sprintf('胸肌');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
hp = impixelinfo;
axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio.
drawnow;

% Erase the gray scale image there.
grayImage(binaryImage) = 0;
% Display the masked image.
subplot(2, 2, 4);
imshow(grayImage);
axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio.
caption = sprintf('Image with Pectoral Muscle Masked out.');
title(caption, 'FontSize', fontSize);
drawnow;
figure,imshow(grayImage);

imwrite(grayImage,'170.jpg');
