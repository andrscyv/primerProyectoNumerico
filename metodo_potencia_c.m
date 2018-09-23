function [sigmai ,qi] = metodo_potencia_c(A, q0, k, tol,vecReferencia)
%METODO POTENCIA implementacion del metodo de la potencia
%En este método se calcula la razón de convergencia de acuerdo a un vector de referencia
%   A es la matriz a la que se la a aplicar el método
% 	q0 es un vector que se va a ir aproximando al eigenvector dominante
%	k es el número máximo de iteraciones
%	tol es el número de dígitos de precisión que se quieren
%	vecReferencia es el eigenvector	normalizado al que va a converger el método (el dominante)
qi = q0;
err = inf;
ind = 1;
sigmai = maxAbsSignado(qi);
while (ind <= k) && (err > tol)
    sigma0 = sigmai;
    q0 = qi;
    qi = A*qi;
    sigmai = maxAbsSignado(qi);
    qi = qi/sigmai;
    ind = ind+1;
    err = abs(sigmai - sigma0) / abs(sigma0);
    radioConvergencia = radioC(qi,q0,vecReferencia) %imprime a cada iteración la razón con el vector de referencia dado
end
%ind
end
