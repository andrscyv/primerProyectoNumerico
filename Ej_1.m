%Script para correr el m�todo de la potencia
close all; clear all; clc
format long
A = [1 -2 0; 1 17 -2; 5 7 7]
q0 = [1 1 1]'

disp('Resultado m�todo potencia: ')
[sigmai, qi] = metodo_potencia(A,q0,100,0.0001)
[V, D] = eig(A)

disp('Diferencia de sigmai y valor exacto')
diferenciaSigmaValorPropio = abs(sigmai-D(3,3))

v = V(:,3)
v = v/maxAbsSignado(v)
metodo_potencia_c(A,q0,100,0.0001,v)
