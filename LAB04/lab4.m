% Task 1: Split frequency
img = im2double(imread('lena.jpg'));
ratio = 0.1;

% High/Low pass with 0.1 ratio
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
figure, imshow(low_pass_img);
figure, imshow(high_pass_img + 0.5);
imwrite(low_pass_img, 'lena_low_0.1.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.1.jpg');

% High/Low pass with 0.2 ratio
ratio = 0.2;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
figure, imshow(low_pass_img);
figure, imshow(high_pass_img + 0.5);
imwrite(low_pass_img, 'lena_low_0.2.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.2.jpg');

% Task 2: Hybrid image
img1 = im2double(imread('marilyn.jpg'));
img2 = im2double(imread('einstein.jpg'));

% Using low frequency of img1 and high frequency of img2
ratio = 0.3; % use any ratio
img_merged = hybrid_image(img1, img2, ratio);
figure, imshow(img_merged);
imwrite(img_merged, 'hybrid_1.jpg');

% Using low frequency of img2 and high frequency of img1
img_merged = hybrid_image(img2, img1, ratio);
figure, imshow(img_merged);
imwrite(img_merged, 'hybrid_2.jpg');

% Task 3: Visualization