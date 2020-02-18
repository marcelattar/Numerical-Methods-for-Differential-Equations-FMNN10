


la = -log(1/2)/(30.17*365)
V = -log(1/2)/(90)
k = 0.15;
A = (k*la)/(la+V)
t = linspace(0,10000,1000);

N = @t k/(la+V)*(1-exp(-(la+V)*t));

plot(N(t))