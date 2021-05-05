function [magnitude, orientation] = sobel_feature(img)
% horizontal edge
Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];

% vertical edge
Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1];

% Sobel filtering
horizontalSobel = imfilter(img, Hy);
verticalSobel = imfilter(img, Hx);

% compute gradient magnitude and orientation
M = sqrt(horizontalSobel.^2 + verticalSobel.^2);
theta = atan2(horizontalSobel, verticalSobel);
magnitude = M;
orientation = theta;
end