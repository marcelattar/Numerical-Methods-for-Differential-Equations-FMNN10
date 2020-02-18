u = [1;1];

[T,Y]= adaptiveRK34(@lotka,u,0,10,0.0001)

%plot(T,Y);