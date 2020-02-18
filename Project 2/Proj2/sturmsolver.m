function [V, D] = sturmsolver(N)

T = full(gallery('tridiag',N, 1,-2, 1));

dx = 1/(N+1);

[V, D] = eig(1/(dx^2)*T);

end