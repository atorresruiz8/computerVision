% Load image
img = imread('01.jpg');

% Rotate img by 45 degrees using forward warping
angle = 45;

% shift origin (x0, y0) to center of input image
x0 = 200; 
y0 = 150;
I2 = zeros(300, 400, 3, 'uint8');

% For each pixel (y1, x1) in img:
for y1 = 1:300
    for x1 = 1:400
        % Rotation calculations
        x2 = round(cosd(angle) * (x1 - x0) + sind(angle) * (y1 - y0) + x0);
        y2 = round(-sind(angle) * (x1 - x0) + cosd(angle) * (y1 - y0) + y0);
        % If (y2, x2) is inside I2:
        if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            % I2(y2, x2) = I1(y1, x1)
            I2(y2, x2, :) = img(y1, x1, :);
        end
    end
end

% Show and save image
figure, imshow(I2);
imwrite(I2, 'rotate_0.jpg');

% Rotate img by 45 degrees using backward warping
I3 = zeros(300, 400, 3, 'uint8');

for y1 = 1:300
    for x1 = 1:400
        % Rotation calculations
        x2 = round(cosd(angle) * (x1 - x0) - sind(angle) * (y1 - y0) + x0);
        y2 = round(sind(angle) * (x1 - x0) + cosd(angle) * (y1 - y0) + y0);
        % If (y2, x2) is inside I3:
        if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            % I3(y2, x2) = I1(y1, x1)
            I3(y2, x2, :) = img(y1, x1, :);
        end
    end
end

% Show and save image
figure, imshow(I3);
imwrite(I3, 'rotate_1.jpg');

% Implement median filter for lena, using patch size = 3
lena = im2double(imread('lena_noisy.jpg'));

% Median filter
patch_size = [3, 3];
img_median = median_filter(lena, patch_size);

% Show and save image
figure, imshow(img_median);
imwrite(img_median, 'median_0.jpg');

% Same as above, but use patch size = 5
lena2 = im2double(imread('lena_noisy.jpg'));
patch_size2 = [5, 5];
img_median2 = median_filter(lena2, patch_size2);

% Show and save image
figure, imshow(img_median2);
imwrite(img_median2, 'median_1.jpg');