%Script para correr el m�todo QR con shift din�mico y shift simple
close all; clear all; clc;
[lam1, Q1] = MQR_simple( gallery( 'lehmer', 25 ), 1000, 1E-10);
[lam2, Q2] = MQR_dynamic( gallery( 'lehmer', 25 ), 20, 1E-10);
[V, D] = eigs( gallery( 'lehmer', 25 ), 25);

lam3 = diag(D);

display('Error relativo con QR simple');
errQRSimple = abs(lam1-lam3)./abs(lam3)
display('Error relativo con QR din�mico');
errQRDin = abs(lam2-lam3)./abs(lam3)
