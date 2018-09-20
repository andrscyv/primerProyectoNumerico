function [sigmai,qi] = metodo_potencia_invRayleigh(A, q0, k)
%Metodo de potencia inversa con shift dinamico de Rayleigh
%   
qi = q0;
err = inf;
ind = 1;
sigmai = maxAbsSignado(qi);
while (ind <= k) && (err > norm(qi)*10^(-7))
    shift = (qi'*A*qi)/(qi'*qi);
    qi = (A-eye(size(A))*shift)\qi;
    sigmai = maxAbsSignado(qi);
    qi = qi/sigmai;
    ind = ind+1;
    err = norm(A*qi - shift*qi);
end
%ind
sigmai = 1/sigmai+shift;
end

