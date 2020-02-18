function V = Vvec(N)

dx = 1/(N+1);
i=1;
for k = 0:dx:1
    %V(i) = 1000*(k-0.5)^2;
    %V(i) = 500*(0.5-abs(k-0.5));
    V(i) = 800*(sin(pi*k*2))^2;  % Interesting case.
    %V(i) = 0;
    i =i+1;
end
V(1) = [];
V(end)= [];
end