function Y = resizeRot(A)

  [m, n, r] = size(A);
  diagonal = round(sqrt(power(m, 2) + power(n, 2)));

  Y = zeros(diagonal, diagonal, r);
  Y = uint8(Y);
  
  gapX = round((diagonal - m) / 2);
  gapY = round((diagonal - n) / 2); 

  for x = 1:diagonal
    for y = 1:diagonal
      if ((x > gapX) && (x < (m + gapX))) && ((y > gapY) && (y < (n + gapY)))   
        Y(x, y, :) = A(x - gapX, y - gapY, :);        
      end 
    endfor
  endfor

endfunction