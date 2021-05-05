function output = median_filter(img, patch_size)
    output = zeros(size(img));
    shift_u = patch_size(2);
    shift_v = patch_size(1);
    
    % Shift depends on the filter size
    for u = 1 + shift_u:size(img, 2) - shift_u
        for v = 1 + shift_v:size(img, 1) - shift_v
            % Index range
            x1 = u - floor(shift_u/2);
            x2 = u + floor(shift_u/2);
            y1 = v - floor(shift_v/2);
            y2 = v + floor(shift_v/2);
            
            % Given in the lecture's psuedo code
            patch = img(y1:y2, x1:x2);
            
            % Apply median function twice to get a single value median.
            % This gives the same result as converting matrix to vector.
            temp = median(patch);
            value = median(temp);
            
            % Output the image with the median filter
            output(v, u) = value;
        end 
    end
end