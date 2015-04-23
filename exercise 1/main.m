clc


% Aufgabe 1 a)
N=3;
M=4;
x=linspace(1/(2*N)*pi,pi-1/(2*N)*pi,N);
y=linspace(1/(2*M)*pi,pi-1/(2*M)*pi,M);

[X,Y]=meshgrid(x,y);
F=fa(X,Y);
display('1a)');
display('analytic solution');
F=F'

D=DCT(F);

F2=TDCT(F,x,y)

display('----------------------');


% Aufgabe 1 b)
maximum=50;
P=10;
data=zeros(maximum,1);
for i=1:maximum
    data(i)=dist(P,i);
    
end

plot(data);