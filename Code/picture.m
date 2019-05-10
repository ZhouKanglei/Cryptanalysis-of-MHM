clear;clc;
length = 512;
for i = 1:length
    for j = 1:length
        sum = (i - 1)*length + j - 1;
        A(i, j) = floor(sum/256/256);
        B(i, j) = mod(floor(sum/256), 256);
        C(i, j) = mod(sum, 256);
    end
end
imwrite(A,['A',num2str(length),'.png']);