function [sigmai ,qi] = metodo_potencia(A, q0, k, tol)
%METODO POTENCIA implementacion del metodo de la potencia
%   
%
qi = q0;
err = inf;
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

