% Load image
img = imread('lena.jpg');

% Implement sobel filter, use Hy filter
img = im2double(imread('lena.jpg'));
% Sobel filter
Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge, Hy

img_sobel = sobel_filter(img, Hy);
figure, imshow(img_sobel);
imwrite(img_sobel, 'sobel_y.jpg');

% The same as above, but use Hx filter
img = im2double(imread('lena.jpg'));
% Sobel filter
Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge, Hx

img_sobel2 = sobel_filter(img, Hx);
figure, imshow(img_sobel2);
imwrite(img_sobel2, 'sobel_x.jpg');

% Break 2D filter (Hy) to 1D filter, column-wise first then row-wise
HyCR = [1 1 1; 0 0 0; -1 -1 -1];
img_cols = sobel_filter_cr(img, HyCR);
figure, imshow(img_cols);
imwrite(img_cols, 'sobel_cr.jpg');

% Use row-wise first then column-wise filter
HyRC = [1 0 -1; 1 0 -1; 1 0 -1];
img_rows = sobel_filter_rc(img, HyRC);
figure, imshow(img_cols);
imwrite(img_cols, 'sobel_rc.jpg');

% Implement gaussian filter, using hsize = 5, sigma = 2
hsize = 5; sigma = 2;

img_gaussian = gaussian_filter(img, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_5.jpg');

% Use hsize = 9, sigma = 4
hsize2 = 9; sigma2 = 4;

img_gaussian2 = gaussian_filter(img, hsize2, sigma2);
figure, imshow(img_gaussian2);
imwrite(img_gaussian2, 'gaussian_9.jpg');