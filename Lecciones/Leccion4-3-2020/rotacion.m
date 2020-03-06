clc; clear;
pkg load image;

A = imread('barbara.jpg');

% Rotar de la imagen A
angulo = 135;
a0 = cosd(angulo); a1 = sind(angulo); a2 = 0;
b0 = -sind(angulo); b1 = cosd(angulo); b2 = 0;

T = [a0 a1 a2; b0 b1 b2; 0 0 1;];
Tr = maketform('affine', T'); % Crear la transformacion
B = imtransform(A, Tr);

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(B);