function [radioConvergencia] = radioC(qi,q0,vecReferencia)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
radioConvergencia = norm(qi - vecReferencia,inf)/norm(q0-vecReferencia,inf);
end

