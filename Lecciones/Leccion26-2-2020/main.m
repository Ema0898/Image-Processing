clc; clear;

% Cargar imagen
x = imread('lena_256.jpg');

% Mostrar imagen
% imshow(x);

% Tamaño de la imagen
[m, n, r] = size(x);

% Info de la imagen
% imfinfo('lena_256.jpg')

% Mostrar las primeras 5 filas y columnas de canal rojo
r5 = x(1:5, 1:5, 1);

% Convertir de formanto imagen a double
r5_2 = im2double(r5);

% Guardar los canales en matrices aparte
r = x(:, :, 1); % Canal rojo
g = x(:, :, 2); % Canal verde
b = x(:, :, 3); % Canal azul

% Guardar imagen con solo el canal rojo habilitado
y = zeros(m, n, 3);
y(:, :, 1) = r; % Guardar la info de canal rojo
y = uint8(y);

%imshow(y);

% Guardar la imagen
%imwrite(y, 'canal_rojo.jpg', 'quality', 1);

% Descomposición en Valores Singulares
% a = rand(4, 6);
% [u, s, v] = svd(a); % Donde A = U * S * V'

% Comprimir el canal rojo usando la SVD
r = im2double(r);
[u, s, v] = svd(r);
k = 100;
uk = u(:, 1:k); sk = s(1:k, 1:k); vk = v(:, 1:k);
rk = uk * sk * vk';
imshow(rk);