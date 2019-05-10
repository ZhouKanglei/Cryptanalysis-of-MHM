function [X Y] = DST_map(D)
%% 函数功能：得到对角线扫描转换映射的矩阵
% 输出值：对角线扫描转换映射的结果
%% 将二维矩阵对角变换为一维向量
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
            E(1,c) = D(i+1,j);%下移
            X(1,c) = i+1;
            Y(1,c) = j;
            i = i+1;
        else if j+1<=N 
                c=c+1;
                E(1,c)  = D(i,j+1);%右移
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
                 E(1,c)  = D(i-1,j+1);%上对角线移动
                 X(1,c) = i-1;
                 Y(1,c) = j+1;
                 i = i-1;
                 j = j+1;
            end
        end
        
        if j+1<=N
            c=c+1;
            E(1,c) = D(i,j+1);%右移
            X(1,c) = i;
            Y(1,c) = j+1;
            j = j+1;
        else if i+1<=M
                c=c+1;
                E(1,c) = D(i+1,j);%下移
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
                 E(1,c) = D(i+1,j-1);%下对角线移动
                 X(1,c) = i+1;
                 Y(1,c) = j-1;
                 i = i+1;
                 j = j-1;
             end
        end  
    end
%% 将一维向量变换为二维矩阵
       for i = 1:M
            for j = 1:N
                O(i,j) = E(1,(i-1)*N+j);
                X(2,(i-1)*N+j) = i;
                Y(2,(i-1)*N+j) = j;
            end
       end
end