function [corner_x, corner_y] = Harris_corner_detector(I, name, sigma1, sigma2, alpha, Rthreshold)
% Get the Gaussian kernels
H1 = 1 + 2 * (sigma1 * 2);
H2 = 1 + 2 * (sigma2 * 2);

kernelH1 = fspecial('gaussian', H1, sigma1);
kernelH2 = fspecial('gaussian', H2, sigma2);

% Derivative filter
Dx = [1 0 -1]; Dy = [1; 0; -1];

% Use derivative of Gaussian to compute image gradients
Ix = imfilter(imfilter(I, kernelH1, 'replicate'), Dx, 'replicate');
Iy = imfilter(imfilter(I, kernelH1, 'replicate'), Dy, 'replicate');
G = imfilter(I, kernelH1); % Gaussian filter

% Display/save the filterings
figure, imshow(Ix + 0.5); title('X Gradient');
imwrite(Ix+0.5, sprintf('%s_Ix.png', name));
figure, imshow(Iy + 0.5); title('Y Gradient');
imwrite(Iy+0.5, sprintf('%s_Iy.png', name));
figure, imshow(G); title('Gaussian Filtering');
imwrite(G, sprintf('%s_gaussian.png', name));

% Product of gradients, element wise multiplication
Ixx = Ix .* Ix;
Iyy = Iy .* Iy;
Ixy = Ix .* Iy;

% Matrix M
Sxx = imfilter(Ixx, kernelH2, 'replicate');
Syy = imfilter(Iyy, kernelH2, 'replicate');
Sxy = imfilter(Ixy, kernelH2, 'replicate');

% Corner response
M = [Sxx Sxy; Sxy Syy];
detM = Sxx .* Syy - Sxy .* Sxy;
traceM = Sxx + Syy;

R = detM - alpha * (traceM.^2);
figure, imagesc(R); colormap jet; colorbar; axis image; title('Corner Response');
h = gcf; saveas(h, sprintf('%s_corner_response.png', name));

% Apply thresholding on R
corner_map = R > Rthreshold;
figure, imshow(corner_map); title('Corner Map');
imwrite(corner_map, sprintf('%s_corner_map.png', name));

% Non-maxima Suppression
local_maxima = imregionalmax(R);
figure, imshow(local_maxima); title('Local Maxima');
imwrite(local_maxima, sprintf('%s_local_maxima.png', name));

% final corner map
final_corner_map = corner_map & local_maxima;
[corner_y, corner_x] = find(final_corner_map);
figure, imshow(final_corner_map); title('Final Corner Map');
imwrite(final_corner_map, sprintf('%s_final_corner_map.png', name));
end