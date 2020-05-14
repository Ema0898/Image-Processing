clear; clc;

m = 112 * 92; n = 360;

S = zeros(m, n);
Fmean = zeros(m, 1);

## Calculate S matrix and Fmean
display("Calculate S matrix and Fmean");

k = 1;

for i = 1:40
  for j = 1:9
    img = imread(['Database/' num2str(i) '_' num2str(j) '.png']);
    img = im2double(img);
    F = matrix2col(img);
    Fmean += F;
    S(:, k) = F;
    k += 1;
  endfor
endfor

Fmean /= n;

% imshow(col2matrix(Fmean, 112, 92));

A = zeros(m, n);

## Calculate A matrix
display("Calculate A matrix");
for i = 1:n
  A(:, i) = (S(:, i) - Fmean);
endfor

## Calculate SVD of matrix A
display("Calculate SVD of matrix A");
[U, E, V] = svd(A);


## Calculate the coordinates vector
display("Calculate the coordinates vector");
r = rank(A);

X = zeros(r, r);

for i = 1:r
  X(:, i) = U(:, 1:r)' * A(:, i);
endfor

## Calculate the threshold
display("Calculate the threshold");
e = zeros(1, r);

for i = 1:r
  e(i) = norm(X - X(:, i));
endfor

e1 = max(e);