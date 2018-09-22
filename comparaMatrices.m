function [resp] = comparaMatrices (A, B) 
% A,B con misma dimensión
  resp = 1;
  [m,n]=size(A);
  i=1;
  j=1;
  while (i<=m) && (resp>0)
    while (j<=n) && (resp>0)
      resp = (A(i,j) == B(i,j));
      j=j+1;
    end
    i = i+1;
  end
  
endfunction
