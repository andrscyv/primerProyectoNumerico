function [radioConvergencia] = radioC(qi,q0,vecReferencia)
%Regresa la razón de convergencia entre los dos vectores y el vector de referencia dado
%	q0 vector "q_j"
%	q1 vector "q_{j+1}"
%	vecReferencia es el vector al cual se está aproximando la sucesión
radioConvergencia = norm(qi - vecReferencia,inf)/norm(q0-vecReferencia,inf);
end

