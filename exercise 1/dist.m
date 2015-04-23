function [ eps ] = dist(P, N )
% N x N
x=linspace(1/(2*N)*pi,pi-1/(2*N)*pi,N);
[X,X_]=meshgrid(x,x);
F=fb(X,X_)';

% P x P
xi=linspace(pi/P,pi/P*(P-1),P-1);
[Xi,Xi_]=meshgrid(xi,xi);


% mit F für N x N
A=fb(Xi,Xi_)';
Appr=TDCT(F,xi,xi);
eps=max(max(abs(A-Appr)));
end

