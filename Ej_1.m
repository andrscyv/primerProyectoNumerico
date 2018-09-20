%Script para correr el método de la potencia
close all; clear all; clc
format long
A = [1 -2 0; 1 17 -2; 5 7 7]
q0 = [1 1 1]'

%a)
disp('Resultado método potencia: ')
[sigmai, qi] = metodo_potencia(A,q0,100,0.0001)
[V, D] = eig(A)
%b)
disp('Diferencia de sigmai y valor exacto')
diferenciaSigmaValorPropio = abs(sigmai-D(3,3))

%c)
v = V(:,3)
v = v/maxAbsSignado(v)
metodo_potencia_c(A,q0,100,0.0001,v)

%d)
razonDeAndresito = abs(D(2,2)/D(3,3))