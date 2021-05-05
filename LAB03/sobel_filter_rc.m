function output2 = sobel_filter_rc(img, kernel)
Hy2 = [1 2 1];
rows = size(img, 1);
cols = size(img, 2);
I2 = zeros(rows+2, cols+2);
I2(1+1:rows+1, 1+1:cols+1) = img;
output = zeros(rows+2, cols+2);
output2 = zeros(rows, cols);

for i = 1:rows
    for j = 1:cols
        output(i:i+2, j) = sum(kernel.*I2(i:i+2,j:j+2), 2);
        output2(i, j) = sum(median(Hy2).*output(i:i+2));
    end
end
end