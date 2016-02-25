I = imread('TextDetectionExample_01.png');
[I2,rect] = imcrop(I);
figure, imshow(I2)