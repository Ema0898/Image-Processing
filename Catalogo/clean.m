function Y = clean(A)
  [m, n, r] = size(A);
    
  Y = A;
  A = uint16(A);  
  
  for x = 1:m
    for y = 1:n
      if Y(x, y, 1) == 0 && Y(x, y, 2) == 0 && Y(x, y, 2) == 0 
        % Zona Superior 
        if ((y >= 2 && y <= (n - 1)) && x == 1)
            Y(x, y,:) = ((A(x,y-1,:)+A(x,y+1,:)+A(x+1,y-1,:)+A(x+1,y,:)+A(x+1,y+1,:))/5);
          
        % Zona Inferior
        elseif ((y >= 2 && y <= (n - 1)) && x == m)
            Y(x, y,:) = ((A(x,y-1,:)+A(x,y+1,:)+A(x-1,y-1,:)+A(x-1,y,:)+A(x-1,y+1,:))/5);

        % Zona Izquierda
        elseif (x >= 2 && (x <= (m - 1)) && y == 1)
            Y(x, y,:) = ((A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:)+A(x+1,y,:)+A(x+1,y+1,:))/5); 
        
        % Zona derecha    
        elseif (x >= 2 && (x <= (m - 1)) && y == n)
            Y(x, y,:) = ((A(x-1,y-1,:)+A(x-1,y,:)+A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:))/5);
        
        % Esquina superior izquierda
        elseif (x == 1 && y == 1)
            Y(x, y,:) = ((A(x,y+1,:)+A(x+1,y,:)+A(x+1,y+1,:))/3);
           
        % Esquina superior derecha 
        elseif (x == 1 && y == n)
            Y(x, y,:) = ((A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:))/3);
         
        % Esquina inferior izquierda   
        elseif (x == m && y == 1)
            Y(x, y,:) = ((A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:))/3);
          
        % Esquina inferior derecha  
        elseif (x == m && y == n)
            Y(x, y,:) = ((A(x-1,y-1,:)+A(x-1,y,:)+A(x,y-1,:))/3);

        else
            Y(x,y,:) = ((A(x-1, y-1,:) + A(x-1, y,:) + A(x-1, y+1,:) + A(x, y-1,:) + A(x, y+1,:) 
                    + A(x+1, y-1,:) + A(x+1, y,:) + A(x+1, y+1,:)) / 8);
        end            
      endif
    endfor
  endfor
  
  Y = uint8(Y);
  
endfunction