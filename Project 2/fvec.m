function f = fvec(L,N)
f=[];

for n=0:L/(N+1):L;
   f =[f;sin(n)]; 
end
f(1) = [] ; % removes the first and last value we only want the interior points).
f(end) = []; 
end