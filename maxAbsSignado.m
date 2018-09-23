function [val] = maxAbsSignado(vec)
%Regresa el valor absoluto más grande del vector con su signo original
%   vec	es el vector que se desea, puede ser real o imaginario
[v,index] = max(abs(vec));
val = vec(index);
end