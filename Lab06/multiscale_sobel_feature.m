function feature = multiscale_sobel_feature(img, scale)
% initialize feature vector
feature = [];

for i = 1:scale
    % compute sobel feature, use sobel_feature.m
    [magnitude, orientation] = sobel_feature(img);
    f = magnitude(:); % using magnitude as features
    % f = orientation(:); % using orientation as features
    
    % concatenate feature vector
    feature = cat(1, feature, f(:));
    
    % down-sample image by 2
    img = imresize(img, 0.5);
end
end