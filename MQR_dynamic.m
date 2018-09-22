function [lambdas, Q] = MQR_dynamic(A, k, tol)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m = size(A,1);
lambdas = zeros(m,1);
index = m;
contCompTol = 500;   
while index > 1
    contComp = 0;
    while max(abs(A(index,1:index-1))) > tol && contComp < contCompTol
        contComp = contComp + 1;
        shift = A(index, index);
        identidad = eye(index);
        [Q, R] = qr(A-shift*identidad);
        A =R*Q+shift*identidad;
    end
    if contComp < contCompTol
        lambdas(index,1) = A(index,index);
        index = index - 1 ;
        A = A(1:index, 1:index);
    else
        delta = (A(index-1,index-1)-A(index,index))^2 + 4*A(index, index-1)*A(index-1,index);
        lambdas(index,1) = (A(index-1,index-1)+A(index,index)+sqrt(delta))/2;
        lambdas(index-1,1) = (A(index-1,index-1)+A(index,index)-sqrt(delta))/2;
        index = index - 2;
        A = A(1:index,1:index);
    end
end
if index > 0; lambdas(1,1) = A(1,1);end