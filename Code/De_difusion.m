function [P,P1,O1,O,L] = De_difusion(R0,R,BP,X,Y)
%% 将密文图像消除扩散及边界效应
    [M,N] = size(R0);
    R1 = R;%读入加密后的密文图像   
    [P1,O1,O,L] = De_encryption(R0,R1,X,Y);%返回解密扩散后的图像
    P = P1;
    %% 消除边界替换
    for i = 1:N
        ind = find(BP == P1(1,i));
        P(1,i) = ind(1,1)-1;
        ind = find(BP == P1(M,i));
        P(M,i) = ind(1,1)-1;
    end
end