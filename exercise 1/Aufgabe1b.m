

display('Aufgabe 1b');
maximum=50;
P=10;
errors=zeros(maximum,1);
fb = @(x,y) (x-pi/2).^2+(y-pi/2).^2;
for N=1:maximum
    
    % N x N Stützstellen für DCT
    xn=linspace(1/(2*N)*pi,pi-1/(2*N)*pi,N);
    [Xn,Yn]=meshgrid(xn,xn);
    F=fb(Xn,Yn)';
    D=DCT(F);

    % P x P Auswertungs-Gitter
    xp=linspace(pi/P,pi/P*(P-1),P-1);
    [Xp,Yp]=meshgrid(xp,xp);


    % Auswertung der Funktion auf P Gitter
    A=fb(Xp,Yp)';
    
    % Auswertung der DCT auf P Gitter
    Appr=IDCT(D,xp,xp);
    
    errors(N)=max(max(abs(A-Appr)));
end

loglog(errors);