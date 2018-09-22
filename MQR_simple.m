function [lambdas,Q] = MQR_simple(A, k, tol)

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
cuentaIteracSimple = cont
lambdas = diag(R*Q);
Q = Qbar;

end

