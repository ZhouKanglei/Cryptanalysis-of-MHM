function D = FLD(S,L,M,N)
%% 函数功能：通过异或操作的第一级运算
    D = L;
    for i = 2:M-1
        for j = 2:N-1
            D1(i,j) = bitxor(L(i,j),S(i-1,N));
            D(i,j) = bitxor(D1(i,j),S(i,j+1));         
        end
    end
end