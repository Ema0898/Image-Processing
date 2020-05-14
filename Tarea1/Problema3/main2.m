## Comparation
inputImg = imread("Comparar/40_10.png");
inputImg = im2double(inputImg);
inputImgF = matrix2col(inputImg);

Ximg = U(:, 1:r)' * (inputImgF - Fmean);
Fp = U(:, 1:r) * Ximg;

ef = norm((inputImgF - Fmean) - Fp);

e2 = zeros(1, r);

if ef > e1
  display("The input image is not a face");
else
  display("The input image is a face");
  for i = 1:r
    e2(i) = norm(Ximg - X(:, i));    
  endfor

  [value, index] = min(e2);

  subplot(1, 2, 1);
  imshow(inputImg);
  title(['Input Image']);
  
  subplot(1, 2, 2);
  imshow(col2matrix(S(:,index),112,92));
  title(['Database Image']);

endif