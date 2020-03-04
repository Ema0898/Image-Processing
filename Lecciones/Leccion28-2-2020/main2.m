clc; clear;
A = imread('cameraman.jpg');
B = imread('fondo.jpg');

A = im2double(A);
B = im2double(B);
C = (1 / 3) * (B(:, :, 1) + B(:, :, 2) + B(:, :, 3));

pkg load image

A1 = imresize(A, [256, 256]);
C1 = imresize(C, [256, 256]);

subplot(1, 3, 1);
imshow(-A1 + 1);