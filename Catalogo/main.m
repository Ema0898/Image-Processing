clc; clear;

A = imread('barbara.jpg');

B = rotateClean(A, 70);
C = rotateClean2(A, 70);

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(B);
subplot(1, 3, 3);
imshow(C);
