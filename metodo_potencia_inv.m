function [sigmai,qi] = metodo_potencia_inv(A, q0, rho, k, tol, vecRef)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[sigmai,qi] = metodo_potencia_inv_sin_shift(A-rho*eye(size(A)), q0, k, tol, vecRef);
sigmai = sigmai + rho;
end

