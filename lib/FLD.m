function D = FLD(S,L,M,N)
%% �������ܣ�ͨ���������ĵ�һ������
    D = L;
    for i = 2:M-1
        for j = 2:N-1
            D1(i,j) = bitxor(L(i,j),S(i-1,N));
            D(i,j) = bitxor(D1(i,j),S(i,j+1));         
        end
    end
end