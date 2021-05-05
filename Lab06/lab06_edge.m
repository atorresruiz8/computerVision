img = im2double(imread('lena.jpg'));

% compute gradient magnitude and orientation with Sobel filter
[magnitude, orientation] = sobel_feature(img);

% apply thresholding to detect edge
threshold = 0.3;
e = magnitude > threshold;

% use built-in function to detect edge
e1 = edge(img, 'Sobel'); % change img to sobel edge detection
e2 = edge(img, 'Canny'); % change img to canny edge detection

figure, imshow(img);
figure, imshow(e); title('Sobel Feature');
imwrite(e, 'lena_sobel_feature.jpg');
figure, imshow(e1); title('Sobel Edge');
imwrite(e1, 'lena_sobel_edge.jpg');
figure, imshow(e2); title('Canny Edge');
imwrite(e2, 'lena_canny_edge.jpg');