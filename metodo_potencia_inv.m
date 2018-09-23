function [sigmai,qi] = metodo_potencia_inv(A, q0, rho, k, tol, vecRef)
%METODO POTENCIA INVERSA CON SHIFT implementacion del metodo de la potencia inversa
%En este método se calcula la razón de convergencia de acuerdo a un vector de referencia
%   A es la matriz a la que se la a aplicar el método
% 	q0 es un vector que se va a ir aproximando al eigenvector dominante
%	rho es el shift
%	k es el número máximo de iteraciones
%	tol es el número de dígitos de precisión que se quieren
%	vecReferencia es el eigenvector	normalizado al que va a converger el método (el más pequeño o el más cercano al shift)
[sigmai,qi] = metodo_potencia_inv_sin_shift(A-rho*eye(size(A)), q0, k, tol, vecRef); %manda a llamar al método potencia inversa sin shift con la 
%matriz ya modificada con el shift
sigmai = sigmai + rho; %recupera el eigenvalor sin el shift
end

