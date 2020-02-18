function [unew, err] = RK34step(f, uold, told, h)

unew = RK4step(f,uold,told,h);

T1 = told;
Y1 = uold;
Y1prime = f(T1,Y1);

T2 = T1 + (h/2);
Y2 = Y1 + (h/2)*Y1prime;
Y2prime = f(T2,Y2);

T3 = T1 + (h/2);
Y3 = Y1 + (h/2)*Y2prime;
Y3prime = f(T3,Y3);

TZ3 = T1 + h;
YZ3 = Y1 - h*Y1prime + 2*h*Y2prime;
Z3prime = f(TZ3,YZ3);

T4 = T1 + h;
Y4 = Y1 + h*Y3prime;
Y4prime = f(T4,Y4);

unewRK3 = Y1 + (h/6)*(Y1prime + 2*Y2prime + 2*Y3prime + Y4prime);
znew = Y1 + (h/6)*(Y1prime + 4*Y2prime + Z3prime);
err = znew - unewRK3;

end