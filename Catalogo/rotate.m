function Y = rotate(A, angulo)
  % Angulo debe estar en grados
  % A esta en formato de 8 bits
  
  % Constante de transformacion
  a0 = cosd(angulo); a1 = sind(angulo); 
  b0 = -sind(angulo); b1 = cosd(angulo);
  
  % Centro
  [m, n, r] = size(A);
  xc = round(m / 2); yc = round(n / 2);  
  
  % Crea la matriz para guardar el resultado
  Y = zeros(m, n, r); % La crea en formato double
  Y = uint8(Y);
  
  for x = 1:m
    for y = 1:n
      xnew = mod(round((a0 * (x -xc)) + (a1 * (y - yc)) + xc), m);
      ynew = mod(round((b0 * (x - xc)) + (b1 * (y - yc)) + yc), n);
      xtemp = round((a0 * (x -xc)) + (a1 * (y - yc)) + xc);
      ytemp = round((b0 * (x - xc)) + (b1 * (y - yc)) + yc);
      
      if and(xnew == xtemp, ynew == ytemp) % Para que no tome pixeles que se salen de la imagen rotada
        Y(xnew + 1, ynew + 1, :) = A(x, y, :);
      end         
      
    endfor
  endfor  
  
endfunction