function [P,P1,O1,O,L] = De_difusion(R0,R,BP,X,Y)
%% ������ͼ��������ɢ���߽�ЧӦ
    [M,N] = size(R0);
    R1 = R;%������ܺ������ͼ��   
    [P1,O1,O,L] = De_encryption(R0,R1,X,Y);%���ؽ�����ɢ���ͼ��
    P = P1;
    %% �����߽��滻
    for i = 1:N
        ind = find(BP == P1(1,i));
        P(1,i) = ind(1,1)-1;
        ind = find(BP == P1(M,i));
        P(M,i) = ind(1,1)-1;
    end
end