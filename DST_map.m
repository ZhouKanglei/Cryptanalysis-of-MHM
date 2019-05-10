function [X Y] = DST_map(D)
%% �������ܣ��õ��Խ���ɨ��ת��ӳ��ľ���
% ���ֵ���Խ���ɨ��ת��ӳ��Ľ��
%% ����ά����ԽǱ任Ϊһά����
    i = 1;
    j = 1;
    c = 1;
    [M, N] = size(D);
    E(1, 1) = D(1, 1);
    X(1, 1) = 1;
    Y(1, 1) = 1;
    while ~(i==M & j==N)
   
        if i+1<=M
            c=c+1;
            E(1,c) = D(i+1,j);%����
            X(1,c) = i+1;
            Y(1,c) = j;
            i = i+1;
        else if j+1<=N 
                c=c+1;
                E(1,c)  = D(i,j+1);%����
                X(1,c) = i;
                Y(1,c) = j+1;
                j = j+1;
            else 
                break;
            end   
        end 
        
        while i-1>=1&j+1<=N
            if i-1>=1&j+1<=N
                 c=c+1;
                 E(1,c)  = D(i-1,j+1);%�϶Խ����ƶ�
                 X(1,c) = i-1;
                 Y(1,c) = j+1;
                 i = i-1;
                 j = j+1;
            end
        end
        
        if j+1<=N
            c=c+1;
            E(1,c) = D(i,j+1);%����
            X(1,c) = i;
            Y(1,c) = j+1;
            j = j+1;
        else if i+1<=M
                c=c+1;
                E(1,c) = D(i+1,j);%����
                X(1,c) = i+1;
                Y(1,c) = j;
                i = i+1;
            else
                break;
            end
        end
        
        while i+1<=M&j-1>=1
             if i+1<=M&j-1>=1
                 c=c+1;
                 E(1,c) = D(i+1,j-1);%�¶Խ����ƶ�
                 X(1,c) = i+1;
                 Y(1,c) = j-1;
                 i = i+1;
                 j = j-1;
             end
        end  
    end
%% ��һά�����任Ϊ��ά����
       for i = 1:M
            for j = 1:N
                O(i,j) = E(1,(i-1)*N+j);
                X(2,(i-1)*N+j) = i;
                Y(2,(i-1)*N+j) = j;
            end
       end
end