function [convergencia] = calculaConvergencia(q0,qi,vecReferencia)
%Regresa la razón de convergencia entre los dos vectores y el vector de referencia dado
%	q0 vector "q_j"
%	q1 vector "q_{j+1}"
%	vecReferencia es el vector al cual se está aproximando la sucesión
convergencia = norm(qi - vecReferencia,inf)/norm(q0-vecReferencia,inf)^2;
end

