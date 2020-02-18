function q = qvec(L,N)
q=[];

for n=0:L/(N+1):L;
   q =[q;-50*1e3]; 
end
q(1) = [] ; % remove the first and last value.
q(end) = []; 
end