function unew = TRstep(Tdx,uold,dt)

I = eye(size(Tdx));

runew = uold' + (dt/2)*Tdx*uold';
unew = ((I - (dt/2)*Tdx)\runew)';

end