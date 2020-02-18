syms y(t) a

eqn = diff(y,t,2) == a*y;
cond = y(0) == 0;
cond = y(1) == 0;
ySol(t) = dsolve(eqn, cond);

A = [1 2 3;4 5 6; 7 8 9];
A(3,2);

A(end-1,end-1);

[V, D] = sturmsolver(4)
