function [U, S, V, r] = mSvdEcon (A)
%METODO SVD implementa el método SVD sin ciertos valores a partir del cutOff
  cutOff = 2000;
  %cutOff = 4500;
  %cutOff = 10000;
  [m n] = size(A);
  if comparaMatrices(A,A') == 0  %matrices no simétricas
    if n <= m
      B = A'*A;
    else
      B = A*A';
    end
    [Vtemp,D] = eig(B);  
    valSingulares = sqrt(diag(D)); %obtiene los valores singulares de la matriz no simétrica
  else
    B = A;
    [Vtemp,D] = eig(B);
    valSingulares = diag(D); %como es simétrica, los valores singulares son los eigenvalores
  end
  [valSingulares,indices] = sort(valSingulares,'descend'); %ordenados de mayor a menor
  
  bandSigue = 1;
  r = 1;
  while (r <= size(valSingulares,1)) && (bandSigue == 1) %saca la r a partir de la cual los valores singulares son mayores que el cutOff
    if(valSingulares(r)>cutOff) 
      r = r+1;
    else
      bandSigue = 0;
    end
  end
  r = r-1;
  U = zeros(m,r);
  for i = 1:r
      U(:,i) = 1/valSingulares(i) * A * Vtemp(:,indices(i));
  end
  S = zeros(r,r);
  V = zeros(n,r);
  for i=1:r
    S(i,i) = valSingulares(i,1);
    V(:,i) = Vtemp(:,indices(i));
  end
  
  
endfunction
