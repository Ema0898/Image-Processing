function Y = suavizar(A)
  [m, n, r] = size(A);
    
  Y = zeros(m, n, r);  
  
  for x = 1:m
    for y = 1:n
      % Zona central
      if (x >= 2 && x <= (m - 1)) && (y >= 2 && y <= (n - 1))
          Y(x, y) = promedio8(A, x, y);
         
      % Zona Superior 
      elseif ((y >= 2 && y <= (n - 1)) && x == 1)
          Y(x, y) = ((A(x,y-1)+A(x,y+1)+A(x+1,y-1)+A(x+1,y)+A(x+1,y+1))/5);
        
      % Zona Inferior
      elseif ((y >= 2 && y <= (n - 1)) && x == m)
          Y(x, y) = ((A(x,y-1)+A(x,y+1)+A(x-1,y-1)+A(x-1,y)+A(x-1,y+1))/5);

      % Zona Izquierda
      elseif (x >= 2 && (x <= (m - 1)) && y == 1)
          Y(x, y) = ((A(x-1,y)+A(x-1,y+1)+A(x,y+1)+A(x+1,y)+A(x+1,y+1))/5); 
      
      % Zona derecha    
      elseif (x >= 2 && (x <= (m - 1)) && y == n)
          Y(x, y) = ((A(x-1,y-1)+A(x-1,y)+A(x,y-1)+A(x+1,y-1)+A(x+1,y))/5);
      
      % Esquina superior izquierda
      elseif (x == 1 && y == 1)
          Y(x, y) = ((A(x,y+1)+A(x+1,y)+A(x+1,y+1))/3);
         
      % Esquina superior derecha 
      elseif (x == 1 && y == n)
          Y(x, y) = ((A(x,y-1)+A(x+1,y-1)+A(x+1,y))/3);
       
      % Esquina inferior izquierda   
      elseif (x == m && y == 1)
          Y(x, y) = ((A(x-1,y)+A(x-1,y+1)+A(x,y+1))/3);
        
      % Esquina inferior derecha  
      elseif (x == m && y == n)
          Y(x, y) = ((A(x-1,y-1)+A(x-1,y)+A(x,y-1))/3);
      end      
    endfor
  endfor
  
  Y = uint8(Y);
  
endfunction