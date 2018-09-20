function [sigmai ,qi] = metodo_potencia_c(A, q0, k, tol,vecReferencia)
%METODO POTENCIA implementacion del metodo de la potencia
%   En este método se calcula la razón de convergencia
%
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
    radioConvergencia = radioC(qi,q0,vecReferencia)
end
%ind
end
