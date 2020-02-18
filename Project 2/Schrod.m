% The solver should compute the first few
% eigenvalues (say up to six to ten eigenvalues), and plot both the wave
% functions ? and the probability densities |?|^2.
% Use separate plots for
% wave functions and probability densities.
function Energivec = Schrod(Vvec, N)

T = full(gallery('tridiag',N,1,-2,1));
dx = 1/(N+1);
x=0:dx:1;
Vmatrix = diag(Vvec);

[eigenmodematrix,eigenvaluematrix] = eig((1/(dx^2)).*T-Vmatrix);

Energivec = -fliplr(diag(eigenvaluematrix)'); % Takes out the diagonal elemnts in D (which are the eigenvalues)
                                             % and flips the vector so that the
                                             % smallest elements are first.
Energivec = Energivec(1:10);

figure
hold on
grid on
for k=0:6
    eigenmodevector = eigenmodematrix(:,end-k)';                % Takes out the eigenmodevector
    eigenmodevector = [0, eigenmodevector, 0];       % Appends the Boundary values
    plot(x,(1e3).*normc(eigenmodevector') + ones(1,length(eigenmodevector))'*Energivec(k+1))   % Plot for the three first eigenmodes
end
set(gca,'FontSize',15)
xlabel('x');
ylabel('Wave function');
hold off

figure
hold on
grid on
for k=0:6
    abseigenmodevector = eigenmodematrix(:,end-k)';                % Takes out the eigenmodevector
    abseigenmodevector = [0; abs((1.5e2).*normc(abseigenmodevector')).^2; 0];       % Appends the Boundary values
    plot(x,abseigenmodevector + ones(1,length(abseigenmodevector))'*Energivec(k+1))     % Plot for the three first eigenmodes
end
set(gca,'FontSize',15)
xlabel('x');
ylabel('Probability Density');

end