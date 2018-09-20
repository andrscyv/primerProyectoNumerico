function [convergencia] = calculaConvergencia(q0,qi,vecReferencia)
%
%
convergencia = norm(qi - vecReferencia,inf)/norm(q0-vecReferencia,inf)^2;
end

