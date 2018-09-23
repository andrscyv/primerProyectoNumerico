function [lambdas,Q] = MQR_simple(A, k, tol)
%METODO QR SIMPLE implementación del método qr sin shift
%   A es la matriz a la que se la a aplicar el método
%	k es el número máximo de iteraciones
%	tol es el número de dígitos de precisión que se quieren

[m,n] =size(A);

Q = eye(m,m);
Qbar=Q;
R = A;
cont = 0;
Am = A;
while(cont<k && norm(diag(Am,-1))>=tol)
    Am =R*Q;
    [Q,R] = qr(Am);
    Qbar = Qbar*Q;
    cont = cont +1;
end
cuentaIteracSimple = cont %imprime el número de iteraciones que se hicieron para determinar si llegó al rango de tolerancia requerido.
lambdas = diag(R*Q);
Q = Qbar;

end

