clc

RGB=imread('peppers.png');
F=im2double(rgb2gray(RGB));


[N,M]=size(F);

F2 = zeros(N,M);

sigma = 1.0/255*[10 15 25 37 51 66 82 100 ;
    15 19 28 39 52 67 83 101 ;
    25 28 35 45 58 72 88 105 ;
    37 39 45 54 66 79 94 111;
    51 52 58 66 76 89 103 119; 
    66 67 72 79 89 101 114 130; 
    82 83 88 94 103 114 127 142; 
    100 101 105 111 119 130 142 156 ];


for block_i=1:8:N
    for block_j=1:8:M
        
        DCT_block = DCT(F(block_i:block_i+7, block_j:block_j+7));
        
        %% hier komprimieren
        DCT_block=fix(DCT_block ./ sigma);
        DCT_block = DCT_block .* sigma;
        
        %% ende kompression
        x = linspace(pi/(2*8),pi-pi/(2*8),8);        
        F2(block_i:block_i+7, block_j:block_j+7)=IDCT(DCT_block,x,x);
        
        
    end
end

imshow(F2);