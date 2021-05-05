function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
% Apply FFT
frequency_map = fft2(img);

% shift the frequency map
shifted_frequency_map = fftshift(frequency_map);

% compute low-frequency mask
height = size(img, 1);
width = size(img, 2);

% from lecture pseudo code
x0 = floor(width/2);
y0 = floor(height/2);

% related to the ratio
y1 = y0 - floor(ratio*(height/2));
y2 = y0 + floor(ratio*(height/2));
x1 = x0 - floor(ratio*(width/2));
x2 = x0 + floor(ratio*(width/2));

mask = zeros(size(img));
mask(y1:y2, x1:x2,:) = 1;

% separate low-frequency and high-frequency maps
shifted_low_frequency_map = shifted_frequency_map .* mask;
shifted_high_frequency_map = shifted_frequency_map .* (1-mask);

% shift frequency maps back
low_frequency_map = ifftshift(shifted_low_frequency_map);
high_frequency_map = ifftshift(shifted_high_frequency_map);

% apply Inverse FFT
low_pass_img = real(ifft2(low_frequency_map));
high_pass_img = real(ifft2(high_frequency_map));
end