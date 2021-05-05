% testing template matching SSD and normcorr
% using einstein1.jpg and einstein2.jpg

img = im2double(imread('einstein1.jpg'));
img2 = im2double(imread('einstein2.jpg'));
template = im2double(imread('template.jpg'));

% SSD, einstein1.jpg
threshold = 25;
[output, match] = template_matching_SSD(img, template, threshold);
figure, imshow(output ./ max(output(:)));
imwrite(output ./ max(output(:)), 'einstein1_ssd_output.jpg');
figure, imshow(match);
imwrite(match, 'einstein1_ssd_match.jpg');

% SSD, einstein2.jpg
threshold = 25;
[output, match] = template_matching_SSD(img2, template, threshold);
figure, imshow(output ./ max(output(:)));
imwrite(output ./ max(output(:)), 'einstein2_ssd_output.jpg');
figure, imshow(match);
imwrite(match, 'einstein2_ssd_match.jpg');

% normcorr, einstein1.jpg
threshold = 0.5;
[output, match] = template_matching_normcorr(img, template, threshold);
figure, imshow(output ./ max(output(:)));
imwrite(output ./ max(output(:)), 'einstein1_normcorr_output.jpg');
figure, imshow(match);
imwrite(match, 'einstein1_normcorr_match.jpg');

% normcorr, einstein2.jpg
threshold = 0.5;
[output, match] = template_matching_normcorr(img, template, threshold);
figure, imshow(output ./ max(output(:)));
imwrite(output ./ max(output(:)), 'einstein2_normcorr_output.jpg');
figure, imshow(match);
imwrite(match, 'einstein2_normcorr_match.jpg');