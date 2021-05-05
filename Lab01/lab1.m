% Load image
img = imread('01.jpg');
img2 = imread('02.jpg');
img3 = imread('03.jpg');
img4 = imread('04.jpg');
img5 = imread('05.jpg');
img6 = imread('06.jpg');

% Set green channel to 0
green = img;
green(:,:,2) = 0;

% Convert to grayscale
Y = (0.299*img(:,:,1)) + (0.587*img(:,:,2)) + (0.114*img(:,:,3));

% Rotate the image 90 degrees
rot = imrotate(img, 90);

% Crop to the upper left (30, 100) and lower right (270, 300)
crop = img(30:100, 270:300, :);

% Horizontally flip the image
flipped = flip(img);

% Combine images 01-04.jpg into one matrix with 2x2 grid and 10 pixels
% separation
canvas = zeros(650, 830, 3, 'uint8');
canvas(1:300,1:400,:) = img;
canvas(321:620, 1:400,:) = img2;
canvas(1:300, 421:820,:) = img3;
canvas(321:620, 421:820,:) = img4;

% Converts images 05 and 06.jpg to vectors and average them
img5 = img5(:);
img6 = img6(:);
average = (img5 + img6) / 2;
average = reshape(average, 375, 1242, 3);

% Show image
figure, imshow(average);

% Save image, changing with the each new image format to save
imwrite(average, 'average.jpg');
