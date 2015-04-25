clc


% Aufgabe 1 a)
N=3;
M=4;
x=linspace(1/(2*N)*pi,pi-1/(2*N)*pi,N);
y=linspace(1/(2*M)*pi,pi-1/(2*M)*pi,M);

[X,Y]=meshgrid(x,y);


display('Aufgabe 1a');
display('f Auswertung');
F=(cos(2*X)+cos(3*Y))'

display('IDCT(DCT(F),x,y)');
D=DCT(F);
F2=IDCT(D,x,y);
display(F2);
error = norm(F-F2)