function [out] = estimate_signal(stft, n)
    mod = flip(stft); 
    stft = [stft; mod];
    inverse = ifft(stft, n);
    inverse = real(inverse(1:256,:));
    front = inverse(1:128,2:end);
    back = inverse(129:end,1:end-1);
    overlapfix = (front + back)./2;
    out_temp = [inverse(1:128,1), overlapfix, inverse(129:256, end)];
    output = reshape(out_temp, numel(out_temp), 1);
    out = [output; zeros(8000-length(output),1)];
end