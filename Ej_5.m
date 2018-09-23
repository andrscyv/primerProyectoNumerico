%Script para correr el m�todo QR con shift din�mico y shift simple
close all; clear all; clc;
format long

disp('------------------------------------------------------')
disp('M�todo QR simple')
[lam1, Q1] = MQR_simple( gallery( 'lehmer', 25 ), 1000, 1E-10);

disp('------------------------------------------------------')
disp('M�todo QR din�mico')
[lam2, Q2] = MQR_dynamic( gallery( 'lehmer', 25 ), 20, 1E-10);
[V, D] = eigs( gallery( 'lehmer', 25 ), 25);

lam3 = diag(D);

disp('------------------------------------------------------')
display('Error relativo con QR simple');
errQRSimple = abs(lam1-lam3)./abs(lam3)
disp('------------------------------------------------------')
display('Error relativo con QR din�mico');
errQRDin = abs(lam2-lam3)./abs(lam3)


%display('intentamos con matriz no simetrica')
%A=[1 5 2;7 8 5; 5 6 3];
%[lam2, Q2] = MQR_dynamic( A, 1000, 1E-10)
