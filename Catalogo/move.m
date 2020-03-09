function Y = move(A, deltaX, deltaY)
  
  [m, n, r] = size(A);
  Y = zeros(m, n, r);
  Y = uint8(Y);
  
  a0 = 1; a1 = 0; a2 = deltaX;
  b0 = 0; b1 = 1; b2 = deltaY;
  
  for x = 1:m
    for y = 1:n
      xnew = mod(round((a0 * x) + (a1 * y) + a2), m);
      ynew = mod(round((b0 * x) + (b1 * y) + b2), n);
      xtemp = round((a0 * x) + (a1 * y) + a2);
      ytemp = round((b0 * x) + (b1 * y) + b2);
      
      if and(xnew == xtemp, ynew == ytemp) % Para que no tome pixeles que se salen de la imagen rotada
        Y(xnew + 1, ynew + 1, :) = A(x, y, :);
      end   
      
    endfor
  endfor
  
endfunction
