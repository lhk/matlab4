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
