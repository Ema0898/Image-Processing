function Y = matrix2col(A)
  [m, n] = size(A);

  Y = zeros(m * n, 1);

  k = 1;

  for x = 1:m
    for y = 1:n
      Y(k, 1) = A(x, y);
      k += 1;
    endfor
  endfor


endfunction