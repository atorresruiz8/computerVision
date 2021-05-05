function [output, match] = template_matching_normcorr(img, template, threshold)
output = img;
shift_u = floor(size(template, 1)/2);
shift_v = floor(size(template, 2)/2);

I1 = zeros(size(img,1)+shift_u*(2), size(img,2)+shift_v*(2));
I1(1+shift_u:size(I1,1)-shift_u, 1+shift_v:size(I1,2)-shift_v) = img;

for u = 1 + shift_u:size(I1, 2) - shift_u
        for v = 1 + shift_v:size(I1, 1) - shift_v
            x1 = u - shift_u; x2 = u + shift_u;
            y1 = v - shift_v; y2 = v + shift_v;
            patch = I1(y1:y2, x1:x2);
            
            % Normalized Cross-Correlation
            patchMean = mean(patch(:));
            templateMean = mean(template(:));
            
            % subtract mean
            patchPrime = patch(:) - patchMean;
            templatePrime = template(:) - templateMean;
            
            % normalize length to 1
            patchNorm = patchPrime/(norm(patchPrime));
            templateNorm = templatePrime/(norm(templatePrime));
            
            % normcorr = dot(normalized patch, normalized template)
            value = dot(patchNorm, templateNorm);
            output(v-shift_v, u-shift_u) = value;
        end
end
    
% threshold
    match = (output > threshold);
end