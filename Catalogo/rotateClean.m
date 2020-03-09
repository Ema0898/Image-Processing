function Y = rotateClean(A, angle)
  Y = rotate(A, angle);
  Y = clean(Y);
endfunction