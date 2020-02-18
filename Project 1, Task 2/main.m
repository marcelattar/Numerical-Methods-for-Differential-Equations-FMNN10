%MAIN method
t0 = 1;
y0 = 2;
tf = 2;
N = 10000;
h=0.1;
tol = 0.001;

%[unew, err] = RK34step(@yprime, y0, t0, h)

[approx,error] = RK4integrate(@yprime, y0, t0, tf, N)

%ervarstep(@yprime,y0,t0,tf)

%tvector,yvector] = adaptiveRK34(@yprime, y0, t0, tf, tol);

%plot(tvector,yvector)