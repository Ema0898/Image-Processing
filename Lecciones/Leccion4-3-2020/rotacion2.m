clc; clear;
pkg load image

A = imread('barbara.jpg');
%A = rgb2gray(A);

% Rotar de la imagen A
angulo = 30;

B = rotar(A, angulo);

C = suavizar(B);


subplot(2, 2, 1);
imshow(A);
subplot(2, 2, 2);
imshow(B);
subplot(2, 2, 3);
imshow(C);

%D = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]
%E = suavizar(D)