function [output, match] = template_matching_SSD(img, template, threshold)
    output = img;
    shift_u = floor(size(template, 2)/2);
    shift_v = floor(size(template, 1)/2);
    
    I1 = zeros(size(img,1) + shift_u*(2), size(img,2) + shift_v*(2));
    I1(1+shift_u:size(I1,1)-shift_u,1+shift_v:size(I1,2)-shift_v) = img;
    
    for u = 1 + shift_u:size(I1,2) - shift_u
        for v = 1 + shift_v:size(I1,1) - shift_v
            x1 = u - shift_u; x2 = u + shift_u;
            y1 = v - shift_v; y2 = v + shift_v;
            patch = I1(y1:y2, x1:x2);

            % SSD
            value = patch - template; % I(u+i,v+j) - H(i,j)
            value = sum(sum(value(:).^2)); % sum(sum(I(u+i,v+j)-H(i,j))^2)
            output(v-shift_v, u-shift_u) = value;
        end
    end
    
    % calculate the difference between the template and each image patch
    match = (output < threshold);
end