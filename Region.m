clc;
clear;
close all;
% Read Input Image

InputImage=imread('coins.png');

%Resize the Image

InputImage=imresize(InputImage,[256 256]);

% Display the Image

imshow(InputImage);

% Get graphical Inputs from Mouse,Select 4 Seed Points in Image

[Col Row]=ginput(4);

c =Col;
r =Row;

% Select polygonal region of interest
BinaryMask = roipoly(InputImage,c,r);
figure, imshow(BinaryMask);title('Selected Region of Interest');

%Create Buffer for ROI
ROI=zeros(256,256);

%Create Buffer for NONROI
NONROI=zeros(256,256);
for i=1:256

for j=1:256

if BinaryMask(i,j)==1
ROI(i,j)=InputImage(i,j);

else
NONROI(i,j)=InputImage(i,j);
end

end

end

%Display ROI and Non ROI
figure;
subplot(1,2,1);imshow(ROI,[]);title('ROI');
subplot(1,2,2);imshow(NONROI,[]);title('NON ROI');
