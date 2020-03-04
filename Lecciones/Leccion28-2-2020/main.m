clc; clear;
a = imread('cameraman.jpg');
a = im2double(a);
[m, n] = size(a);
s = svd(a); % Escribe los valores singulares en el vector s
r = min([m, n]);

[U, S, V] = svd(a);

dimensiones = [1 20:20:460 469]

for k = dimensiones
  Uk = U(:, 1:k); Sk = S(1:k, 1:k); Vk = V(:, 1:k);
  A_k = Uk * Sk * Vk';
  
  error = norm(a - A_k);

  subplot(1, 2, 1)
  imshow(a);
  title('Imagen Original');

  subplot(1, 2, 2);
  imshow(A_k);
  title(['Imagen Reconstruida con k = ' num2str(k) ' con error de ' num2str(error)]);
  
  pause(0.5);
 end