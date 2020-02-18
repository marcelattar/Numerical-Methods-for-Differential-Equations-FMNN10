function [eigenmatrix,lambdavector] = SturmSolver(N)

T = full(gallery('tridiag',N,1,-2,1));
dx = 1/(N+1);

[eigenmatrix,D] = eig((1/(dx^2)).*T);

lambdavector = fliplr(diag(D)'); % Takes out the diagonal elemnts in D (which are the eigenvalues)
                                 % and flips the vector so that the
                                 % smallest elements are first.
end