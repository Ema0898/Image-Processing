function Y = scale(A, sX, sY)
  
  [m, n, r] = size(A);
  Y = zeros(m, n, r);
  Y = uint8(Y);
  
  a0 = sX; 
  b1 = sY;
  
  for x = 1:m
    for y = 1:n
      xnew = round(a0 * x);
      ynew = round(b1 * y);

      Y(xnew, ynew, :) = A(x, y, :);   
      
    endfor
  endfor
  
endfunction
