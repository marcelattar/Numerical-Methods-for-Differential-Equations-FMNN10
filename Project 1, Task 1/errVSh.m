    function errVSh(A, y0, t0, tf)  
    
    Globerror = [];
    Stepsize = [];
    %Här varierar jag steglängden.
    for k=1:10;
        N = 2^k;
        globerror = 0;
        stepsize = (tf-t0)/N;
       
        % Nu räknar jag ut globalafelet för en given steglängd.
        for n=1:N;
            [approx,err] = eulerint(A, y0, t0, t0 + (n*stepsize), N);
            globerror = err;
        end
        Globerror = [Globerror, globerror];
        Stepsize = [Stepsize, stepsize];      
    end
    
    % Plottar grafen, globala felet som funktion av steglängden.
    loglog(Stepsize,Globerror)
    set(gca,'FontSize',15)
    grid on;
    xlabel('Stepsize, h');
    ylabel('Global error');
end