function a = promedio8(A, x, y)
  a = ((A(x-1, y-1) + A(x-1, y) + A(x-1, y+1) + A(x, y-1) + A(x, y+1) 
                    + A(x+1, y-1) + A(x+1, y) + A(x+1, y+1)) / 8); 
endfunction