function y = twopBVP(fvec, alpha, beta, L, N)

T = full(gallery('tridiag',N, 1,-2, 1));

dx = L/(N+1);

alphabetav = zeros(length(fvec),1);

alphabetav(1) = alpha;
alphabetav(N) = beta;

fnew = fvec*(dx^2) - alphabetav;

y = T\fnew;


end