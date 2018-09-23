function [G] = google(A)
%Regresa la matriz de google
%   A es la matriz de adyacencia de los nodos (páginas) 
n = size(A,1);
G = zeros(n);
q = 0.15;
ns = A*ones(n,1);
G = G + (q/n)*ones(n);
At = A';
At = (1-q)*At;
for i= 1:n
    At(i,:) = At(i,:)/ns(i);
end
G = G + At;
end

