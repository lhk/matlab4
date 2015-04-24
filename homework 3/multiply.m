a=[8 6 7 4 3 0 0 0 0]

a_num=34768

b=[1 9 1 2 0 0 0 0 0]

b_num=2191

points=ifft(fft(a).*fft(b))

sum=0;

for k=0:length(points)-1
    sum=sum+10^k*points(k+1);
end

display('does it work ?')
sum
a_num*b_num

% now polynomial

poly_fft = ifft(fft([9 -3 -7 45 0 0 0 0]).*fft([-29 +98 0 100  0 0 0 0]))

%%
clc
n=5; m=4;
a=[9,0,-3,-7,45,0,0,0,0,0];
b=[-29,98,0,100,0,0,0,0,0,0];
c=zeros(2*n,1);
for k=0:(n+m-2)
    tmp=0;
    for l=0:k
        tmp = tmp + a(l+1) * b(k-l+1);
    end
    c(k+1) = tmp;
end
c

res_a=0; res_b=0; res_c=0;
for i=1:10
    res_a = res_a + a(i)*5^(i-1);
    res_b = res_b + b(i)*5^(i-1);
    res_c = res_c + c(i)*5^(i-1);
end
eps = res_c-(res_a*res_b)
res_a*res_b
res_c


%%

clc

p1=200*log(200)
p2=400*log(400)
p3=600*log(600)

ges1=p1+p2+p3

q1=p1
q2=400*log(400)
ges2=2*q1+q2


