clc
N=20;
M=30;
F=randn(N,M);
x=linspace(pi/(2*N),pi-pi/(2*N),N);
y=linspace(pi/(2*M),pi-pi/(2*M),M);

F2=IDCT(DCT(F),x,y);

norm(F-F2)

