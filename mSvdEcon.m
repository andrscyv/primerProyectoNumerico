function [U, S, V, r] = mSvdEcon (A)
  cutOff = 2000;
  %cutOff = 4500;
  %cutOff = 10000;
  [m n] = size(A);
  if comparaMatrices(A,A') == 0  %matrices diferentes
    if n <= m
      B = A'*A;
    else
      B = A*A';
    end
    [Vtemp,D] = eig(B);  
    valSingulares = sqrt(diag(D));
  else
    B = A;
    [Vtemp,D] = eig(B);
    valSingulares = diag(D);
  end
  [valSingulares,indices] = sort(valSingulares,'descend');
  
  bandSigue = 1;
  r = 1;
  while (r <= size(valSingulares,1)) && (bandSigue == 1)
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
