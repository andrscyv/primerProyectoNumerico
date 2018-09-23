%Script para correr el método de la potencia
close all; clear all; clc
format long
A = [1 -2 0; 1 17 -2; 5 7 7]
q0 = [1 1 1]'

%a)
disp('------------------------------------------------------')
disp('Resultado método potencia con 10 iteraciones: ')
[sigmai, qi] = metodo_potencia(A,q0,10,0.001)
[V, D] = eig(A)
%b)
disp('------------------------------------------------------')
disp('Diferencia de sigmai y valor exacto: ')
diferenciaSigmaValorPropio = abs(sigmai-D(3,3))

%c)
disp('------------------------------------------------------')
disp('Razones con fórmula dada : ')
v = V(:,3);
disp('Vector propio dominante : ')
v = v/maxAbsSignado(v)
metodo_potencia_c(A,q0,100,0.0001,v);

%d)
disp('------------------------------------------------------')
disp('Radio de convergencia calculado con eigenvalores: ')
radioDeAndresito = abs(D(2,2)/D(3,3))