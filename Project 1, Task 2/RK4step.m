function unew = RK4step(f, uold, told, h)

k1 = uold;
k2 = f(told + h/2,uold + h/2*k1);
k3 = f(told + h/2,uold + h/2*k2);
k4 = f(told + h/2,uold + h/2*k3);

unew = uold + (h/6)*(k1 + 2*k2 + 2*k3 + k4);

end