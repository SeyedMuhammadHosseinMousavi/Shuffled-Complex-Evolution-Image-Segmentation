% Shuffled Complex Evolution Image Segmentation

%% SCE Segmentation
% Cleaning and Loading
clear;
img=imread('ts.jpg');
img_gray=rgb2gray(img);

% Median Filter
img_gray = medfilt2(img_gray,[3 3]);

NS= 3;  % Number of segments
itr=10; % Number of iterations
popl=2; % Number of population

%% Shuffled Complex Evolution (SCE)
[Cost,thresh,variance1] = ShuffledComplexEvolution(img_gray, NS, itr, popl);

%% Statistics and Plot
% Otsu
Otsuthresh = multithresh(img_gray,NS);
Otsuseg_I = imquantize(img_gray,Otsuthresh);
OtsuRGB = label2rgb(Otsuseg_I); 

% SCE Inspired
sortT=sort(thresh);
seg_I = imquantize(img_gray,sortT); 
RGB = label2rgb(seg_I); 

subplot(1,4,1);imshow(img); title('Original');
subplot(1,4,2);imshow(img_gray);title('Gray');
subplot(1,4,3);imshow(RGB);title('Shuffled Complex Evolution Segmented');
subplot(1,4,4);imshow(OtsuRGB);title('Otsu Segmented');



