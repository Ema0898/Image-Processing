function Y = limpiar(Y)
  [m, n, r] = size(Y);
    
  Y=uint16(Y);
  xCombos = [-1 0 1 -1 1 -1 0 1];
  yCombos = [-1 -1 -1 0 0 1 1 1];
  for x=1:m
    for y=1:n
      if and(Y(x,y,1) == 0, Y(x,y,2) == 0, Y(x,y,3) == 0)
        adyacentPixelCount = 0;
        averagePixel = zeros(1,1,r);
        for k=1:8
          try
            averagePixel(1,1,:) = averagePixel(1,1,:) + Y(x + xCombos(k), y + yCombos(k),:);
            adyacentPixelCount++;
          end_try_catch
        endfor
        averagePixel(1,1,:) = averagePixel(1,1,:) / adyacentPixelCount;
        Y(x,y,:) = averagePixel(1,1,:);
      endif
    endfor
  endfor
  
  Y=uint8(Y);
  
endfunction