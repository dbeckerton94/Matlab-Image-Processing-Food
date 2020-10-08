%function FoodPack(image_jpg)
image_jpg = 'C:\Users\Computing\Desktop\Computer Vision\image.bmp';
%Reads Image File
Selected_Image = imread(image_jpg); %read picture 
Selected_Image2 = imresize(Selected_Image, 0.2); % Shrinks Image
imshow(Selected_Image2); %show image
title('Initial Image'); %image name

%Binary Image Conversion
binary_image = im2bw(Selected_Image2, 0.0119); %Convert into Black and White
se = strel('disk',10);

%Image Dilation and Erodes
binary_image = imdilate(binary_image,se);
binary_image = imerode(binary_image,se);

%Remove Any Noise from binary image
figure;imshow(binary_image);
Noise_Removed = bwareaopen(binary_image, 30000);
st = regionprops(Noise_Removed, 'BoundingBox' );

% Edge Detect Cropping
% Detects Bounding Box around White Binary Section
for k = 1 : length(st)
  thisBB = st(k).BoundingBox;
  rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],'EdgeColor','y','LineWidth',2 )
end


NewImage = Selected_Image2(thisBB(2):thisBB(2)+thisBB(4),thisBB(1):thisBB(1)+thisBB(3));
figure;imshow(NewImage,[])

