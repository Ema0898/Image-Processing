function Y = rotateClean2(A, angle)

  Y = resizeRot(A);
  Y = rotate(Y, angle);
  Y = clean(Y);

endfunction