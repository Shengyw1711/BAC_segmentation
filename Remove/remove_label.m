clc;
workspace;  
format long g;
format compact;
fontSize = 20;
hasIPT = license('test', 'image_toolbox');
if ~hasIPT

  message = sprintf('Sorry, but you do not seem to have the Image Processing Toolbox.\nDo you want to try to continue anyway?');
  reply = questdlg(message, 'Toolbox missing', 'Yes', 'No', 'Yes');
  if strcmpi(reply, 'No')
   
    return;
  end
end
folder = 'C:\Users\samwu\Desktop\Matlab\CBIS-DDSM\Remove';
baseFileName = '1.jpg';
fullFileName = fullfile(folder, baseFileName);
if ~exist(fullFileName, 'file')

  fullFileName = baseFileName; 
  if ~exist(fullFileName, 'file')

    errorMessage = sprintf('Error: %s does not exist in the search path folders.', fullFileName);
    uiwait(warndlg(errorMessage));
    return;
  end
end
grayImage = imread(fullFileName);
[rows, columns, numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
  grayImage = grayImage(:, :, 2); 
end
subplot(1, 4, 1);
imshow(grayImage, []);
axis on;
title('原始影像', 'FontSize', fontSize);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

set(gcf, 'Name', 'Demo to Threshold Document', 'NumberTitle', 'Off') 

binaryImage = grayImage > 0;

subplot(1, 4, 2);
imshow(binaryImage, []);
axis on;
title('Initial Binary image', 'FontSize', fontSize);

binaryImage = imfill(binaryImage, 'holes');

binaryImage = ExtractNLargestBlobs(binaryImage, 1);

subplot(1, 4, 3);
imshow(binaryImage, []);
axis on;
title('Breast Only', 'FontSize', fontSize);

mask = bwconvhull(binaryImage);

maskedImage = grayImage; 
maskedImage(~mask) = 0; 

subplot(1, 4, 4);
imshow(maskedImage, []);
axis on;
title('Masked Image', 'FontSize', fontSize);
imwrite(maskedImage,'remove_label_img_1.jpg');