function [sigmai,qi] = metodo_potencia_invRayleigh_convergencia(A, q0, k, vecRef)
%Metodo de potencia inversa con shift dinamico de Rayleigh que imprime la razon de convergencia
%   A matriz a la cual se le aplica el método
%	q0 primer vector que se va a ir modificando
%	k es el número máximo de itreaciones
%	vecRef es el vector al que se quiere aproximar el método
qi = q0;
sigmai = maxAbsSignado(qi);
for ind=1:k
    shift = (qi'*A*qi)/(qi'*qi);
    qi = (A-eye(size(A))*shift)\qi;
    sigmai = maxAbsSignado(qi);
    qi = qi/sigmai;
    convergencia = calculaConvergencia(q0,qi,vecRef) %imprime la convergencia en cada iteración
end
%ind
sigmai = 1/sigmai+shift;
end
