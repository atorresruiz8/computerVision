function output = gaussian_filter(img, hsize, sigma)
H = fspecial('gaussian', hsize, sigma); % kernel
% YOUR CODE HERE
output = zeros(size(img));
% linear filter pseudo code
deltax = size(H, 2);
deltay = size(H, 1);

for x = 1 + deltax:size(img, 2) - deltax
    for y = 1 + deltay:size(img, 1) - deltay
        x1 = x - floor(deltax/2);
        x2 = x + floor(deltax/2);
        y1 = y - floor(deltay/2);
        y2 = y + floor(deltay/2);
        
        patch = img(y1:y2, x1:x2);
        patch = patch .* H;
        patch = patch(:);
        
        value = sum(sum(patch));
        
        output(y, x) = value;
    end
end
end