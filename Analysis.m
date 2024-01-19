% Read the input image
input_image = imread('ct (1).jpg');

% Perform wavelet decomposition
level = 3; % Number of decomposition levels
wavelet = 'db4'; % Wavelet type (Daubechies 4 in this case)
[C, S] = wavedec2(input_image, level, wavelet);

% Access the approximation and detail coefficients at different levels
approximation = appcoef2(C, S, wavelet, level);
details = detcoef2('all', C, S, level);

% Display the original image and its approximation
subplot(2, 2, 1);
imshow(input_image);
title('Original Image');

subplot(2, 2, 2);
imshow(approximation, []);
title('Approximation');

% Display the detail coefficients at different levels
for i = 1:level
    subplot(2, 2, i + 2);
    imshow(details(:,:,i), []);
    title(['Detail Level ' num2str(i)]);
end
