function output = sobel_filter(img, kernel)
% YOUR CODE HERE
rows = size(img, 1);
cols = size(img, 2);
I2 = zeros(rows+2, cols+2);
I2(1+1:rows+1, 1+1:cols+1) = img;
output = zeros(rows+2, cols+2);

for i = 1:rows
    for j = 1:cols
        output(i, j) = sum(sum(kernel.*I2(i:i+2,j:j+2)));
    end
end
end