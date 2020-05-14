function Y = col2matrix(A, m, n)
  Y = zeros(m, n);
  k = 1;

  for x = 1:m
    for y = 1:n
      Y(x,y) = A(k);
      k += 1;
    endfor
  endfor