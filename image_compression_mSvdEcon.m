RGB = imread('quetzalbalam.jpg');

% A modo de comparacion, observa la imagen en la resolucion total...
figure(1);
image(RGB);

% ... contra la imagen que han comprimido.
figure(2);
A = [RGB(:,:,1); RGB(:,:,2); RGB(:,:,3)];
[m,n] = size(A);
rmax = min(m,n);
fprintf('Rango maximo: %4g\n', rmax);

m = m/3;
% La matriz a ser usada en su rutina SVD
A = double(A);
[U,S,V,r] = mSvdEcon(A);
r

% Aqui construimos la matriz en imagen.
k = 1:r;
X = U(:,k)*S(k,k)*V(:,k)';

% La matriz que se puede realmente dibujar
X = uint8(X);
C = cat(3,X(1:m,:),X(m+1:2*m,:),X(2*m+1:3*m,:));
image(C)
