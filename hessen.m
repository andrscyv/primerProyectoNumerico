function [H] = hessen (A)
  [m n] = size(A);
  v = zeros(m,m);
  for i = 1:m-2
    x = (A(i+1:m,i));
    v(1:m-i,i) = -sign(x(1)+eps)*norm(x)*eye(m-i,1)-x;
    v(1:m-i,i) = v(1:m-i,i)/norm(v(1:m-i,i));
    A(i+1:m, i:m) = A(i+1:m,i:m)-2*v(1:m-i,i)*v(1:m-i,i)'*A(i+1:m,i:m);
    A(1:m,i+1:m) = A(1:m,i+1:m)-2*A(:,i+1:m)*v(1:m-i,i)*v(1:m-i,i)';
  end
endfunction
