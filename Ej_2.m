%Script para correr el método de la potencia inversa con shift
close all; clear all; clc
format long
A = [1 -2 0; 1 17 -2; 5 7 7]
q0 = [1 1 1]'

[V, D] = eig(A)
v = V(:,1);
vecReferencia = v/maxAbsSignado(v)

rho = 0;

%rho = 0

%a) y %c)
disp('Resultado método potencia inversa con shift 0: ')
[sigmai, qi] = metodo_potencia_inv(A,q0,rho,100,0.0001,vecReferencia)

%b)
disp('Diferencia de sigmai y valor exacto')
diferenciaSigmaValorPropio = abs(sigmai-D(1,1))

%d)
razonDeAndresito = abs(D(1,1)/D(2,2))

%rho = 8.5

v = V(:,2);
vecReferencia = v/maxAbsSignado(v)

rho = 8.5;

%a) y %c)
disp('Resultado método potencia inversa con shift 8.5: ')
[sigmai, qi] = metodo_potencia_inv(A,q0,rho,100,0.00000001,vecReferencia)

%b)
disp('Diferencia de sigmai y valor exacto')
diferenciaSigmaValorPropio = abs(sigmai-D(2,2))

%d)
razonDeAndresito = abs((D(2,2)-rho)/(D(3,3)-rho))
