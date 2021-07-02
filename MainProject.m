clc
clear all
close all
warning off
RGB=imread('yellowlily.jpg');

subplot(3,3,1);
imshow(RGB);
title('Original Image');

[BW,maskedImage] = segmentImage(RGB)
subplot(3,3,2);
imshow(BW);
title('Segmented Binary Image');
subplot(3,3,3);
imshow(maskedImage);
title('Mask Image');
level=graythresh(RGB);
c=im2bw(RGB,level);
subplot(3,3,4)
imshow(c);
title('Tresholded Output Image');


% object in the image is represented by white colour
% background is represented by black colour
I = 255 - RGB;                % Invert the image
subplot(3,3,5),imshow(I),title('Inverted Image');
SE = strel('square',3);     % generate the structuring element
E = imerode(I,SE);          % Perform Erosion Operation
subplot(3,3,6),imshow(E),title('Eroded Image');
D = imdilate(I,SE);          % Perform Dilation Operation
subplot(3,3,7),imshow(D),title('Dilated Image');
O = imopen(I,SE);          % Perform Opening Operation
subplot(3,3,8),imshow(O),title('Opened Image');
C = imclose(I,SE);          % Perform Closing Operation
subplot(3,3,9),imshow(C),title('Closed Image');



