% Implement Gaussian Pyramid and Laplacian Pyramid
img = im2double(imread('einstein1.jpg'));

sigma = 2.0;
hsize = 7;
scale = 5;

% Gaussian Pyramid
I = img;
for s = 1:scale
   % Gaussian filter
   H = fspecial('gaussian', hsize, sigma); % kernel
   I = imfilter(I, H); % Gaussian filter
   
   % Save or show image
   imwrite(I, sprintf('Gaussian_scale%d.jpg', s));
   %figure, imshow(I);
   
   % Down-sampling
   I = imresize(I, 0.5);
end

% Laplacian Pyramid
I = img;
for s = 1:scale
   % Gaussian filtering
   H = fspecial('gaussian', hsize, sigma); % kernel
   G = imfilter(I, H); % Gaussian filter
   
   % Laplacian filtering
   I = img - G; % Laplacian filtering output = input image - Gaussian filtering output
   
   % Save or show image
   imwrite(I + 0.5, sprintf('Laplacian_scale%d.jpg', s));
   %figure, imshow(I);
   
   % Down-sampling
   I = img;
   I = imresize(I, 0.5);
   img = imresize(img, 0.5);
end
