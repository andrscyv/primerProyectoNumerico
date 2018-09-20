function [sigmai,qi] = metodo_potencia_invRayleigh_convergencia(A, q0, k, vecRef)
%Metodo de potencia inversa con shift dinamico de Rayleigh
%   
qi = q0;
sigmai = maxAbsSignado(qi);
for ind=1:k
    shift = (qi'*A*qi)/(qi'*qi);
    qi = (A-eye(size(A))*shift)\qi;
    sigmai = maxAbsSignado(qi);
    qi = qi/sigmai;
    convergencia = calculaConvergencia(q0,qi,vecRef)
end
%ind
sigmai = 1/sigmai+shift;
end
