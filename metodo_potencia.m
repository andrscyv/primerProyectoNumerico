function [sigmai ,qi] = metodo_potencia(A, q0, k, tol)
%METODO POTENCIA implementacion del metodo de la potencia
%   A es la matriz a la que se la a aplicar el método
% 	q0 es un vector que se va a ir aproximando al eigenvector dominante
%	k es el número máximo de iteraciones
%	tol es el número de dígitos de precisión que se quieren
qi = q0;
err = inf; %error colocado  en infinito para que siempre entre por primera vez
ind = 1;
sigmai = maxAbsSignado(qi);
while (ind <= k) && (err > tol)
    sigma0 = sigmai;
    qi = A*qi;
    sigmai = maxAbsSignado(qi);
    qi = qi/sigmai;
    ind = ind+1;
    err = abs(sigmai - sigma0) / abs(sigma0);
end
%ind
end

