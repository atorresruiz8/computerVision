img = im2double(imread('new_york.jpg'));
frequency_map = fftshift(fft2(img));
img2 = im2double(imread('flowers.jpg'));
frequency_map2 = fftshift(fft2(img2));

% Try to display the color frequency map
figure, imagesc(log(abs(frequency_map)+1)), colormap jet;
figure, imagesc(log(abs(frequency_map)+1)), colormap jet;