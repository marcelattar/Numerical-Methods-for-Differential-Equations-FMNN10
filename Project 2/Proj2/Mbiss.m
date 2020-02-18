function M = Mbiss(L,N)

M=[];

for n = 0: L/(N+1): L
    
    M = [M; -50];
    
end

M(1) = [];
M(end) = [];

end