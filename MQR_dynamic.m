function [lambdas, Q] = MQR_dynamic(A, k, tol)
%METODO QR DINÁMICO implementación del método qr sin shift
%   A es la matriz a la que se la a aplicar el método
%	k es el número máximo de iteraciones
%	tol es el número de dígitos de precisión que se quieren
m = size(A,1);
lambdas = zeros(m,1);
index = m;
contCompTol = 500;   
contIterac = 0;
if(!comparaMatrices(A,A')) %matrices no simetricas para el shift dinámico
  A = hess(A); %hace una matriz de hessenberg con le método de matlab para que sea más rápido al usar el shift de wilkinson
  while index > 1
    contComp = 0;
    while max(abs(A(index,1:index-1))) > tol && contComp < contCompTol
        contComp = contComp + 1;
        del = 1/2*( A(index-1,index-1)-A(index,index));
        signDel = del/abs(del);
        shift = A(index, index)-signDel*(A(index-1,index)^2/(abs(del)+sqrt(del^2+A(index,index-1)^2)));
		%usa el shift de wilkinson
        identidad = eye(index);
        [Q, R] = qr(A-shift*identidad);
        A =R*Q+shift*identidad;
        contIterac = contIterac + 1;
    end
    if contComp < contCompTol
        lambdas(index,1) = A(index,index);
        index = index - 1 ;
        A = A(1:index, 1:index);
    else
		%lambda = (-b +- sqrt(b^2-4ac))/2a 
        delta = (A(index-1,index-1)-A(index,index))^2 + 4*A(index, index-1)*A(index-1,index); %determinante 
        lambdas(index,1) = (A(index-1,index-1)+A(index,index)+sqrt(delta))/2; 
        lambdas(index-1,1) = (A(index-1,index-1)+A(index,index)-sqrt(delta))/2;
        index = index - 2;
        A = A(1:index,1:index);
    end
  end
else  %matrices simetricas
  while index > 1
      contComp = 0;
      while max(abs(A(index,1:index-1))) > tol && contComp < contCompTol
          contComp = contComp + 1;
          del = 1/2*( A(index-1,index-1)-A(index,index));
          signDel = del/abs(del);
          shift = A(index,index); %shift normal
          identidad = eye(index);
          [Q, R] = qr(A-shift*identidad);
          A =R*Q+shift*identidad;
          contIterac = contIterac + 1;
      end
      if contComp < contCompTol
          lambdas(index,1) = A(index,index);
          index = index - 1 ;
          A = A(1:index, 1:index);
      else
          delta = (A(index-1,index-1)-A(index,index))^2 + 4*A(index, index-1)*A(index-1,index); %discriminante
          lambdas(index,1) = (A(index-1,index-1)+A(index,index)+sqrt(delta))/2;
          lambdas(index-1,1) = (A(index-1,index-1)+A(index,index)-sqrt(delta))/2;
          index = index - 2;
          A = A(1:index,1:index);
      end
  end
end
if index > 0 
    lambdas(1,1) = A(1,1);
end
[lambdas, I] = sort(abs(lambdas),'descend');
contIteracDinam = contIterac
end