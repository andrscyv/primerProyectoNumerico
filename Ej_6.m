%Matriz de adyacencia para caso 2n+1 = 7
A = [0 1 1 1 1 1 1 ; 1 0 0 1 0 0 0;1 0 0 0 1 0 0; 1 0 0 0 0 1 0; 1 0 0 0 0 0 1; 1 1 0 0 0 0 0 ;1 0 1 0 0 0 0]

%Su matriz de google
G = google(A)
q0 = [1 0 0 0 0 0 0]';
[lam, v] = metodo_potencia(G,q0 ,100,0.001)

%Para el caso en que las flechas unidireccionales son bidireccionales

A = [0 1 1 1 1 1 1 ; 1 0 0 1 0 1 0;1 0 0 0 1 0 1; 1 1 0 0 0 1 0; 1 0 1 0 0 0 1; 1 1 0 1 0 0 0 ;1 0 1 0 1 0 0];
%Su matriz de google
G = google(A)
q0 = [1 0 0 0 0 0 0]';
[lamPrima, vPrima] = metodo_potencia(G,q0 ,100,0.001)