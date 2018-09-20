function [sigmai,qi] = metodo_potencia_inv_sin_shift(A, q0, k, tol,vecRef)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
qi = q0;
err = inf;
ind = 1;
sigmai = maxAbsSignado(qi);
while (ind <= k) && (err > tol)
    sigma0 = sigmai;
    q0 = qi;
    qi = A\qi;
    sigmai = maxAbsSignado(qi);
    qi = qi/sigmai;
    ind = ind+1;
    err = abs(sigmai - sigma0) / abs(sigma0);
    radioConvergencia = radioC(qi, q0, vecRef)
end
%ind
sigmai = 1/sigmai;
end


