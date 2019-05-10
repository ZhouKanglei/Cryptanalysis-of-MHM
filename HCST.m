function T=HCST(B,C,M,N,I)
%% 函数功能：移位置乱，HCST
%形式参数：B、C为混沌行、列序列，I为图像矩阵，M、N为行列数
%返回：T1为列移位矩阵，T为行移位矩阵
 %% 列移位变换
     %imshow(I);
     [M,N] = size(I);
     T1 = I;
     for i = 1:N    
        step=B(1,i);
        if mod(step,2)==0%该列循环下移step步长
            for j = 1:M
                if mod(j-step+M,M)==0
                    T1(j,i) = I(M,i);
                else
                    T1(j,i) = I(mod(j-step+M,M),i);
                end
            end
        else%该列循环上移step步长
            for j = 1:M
                if mod(j+step,M)==0
                    T1(j,i) = I(M,i);
                else
                    T1(j,i) = I(mod(j+step,M),i);
                end           
            end
        end
        %imshow(T1);
     end  
     T = T1;
     
   %% 行移位变换
     for i = 1:M
        step=C(1,i);
        if mod(step,2)==0%该行循环右移step步长
            for j = 1:N
                if mod(j-step+N,N)==0
                    T(i,j) = T1(i,N);
                else
                    T(i,j) = T1(i,mod(j-step+N,N));
                end
            end
        else%该行循环左移step步长
            for j = 1:N
                if mod(j+step,N)==0
                    T(i,j) = T1(i,N);
                else
                    T(i,j) = T1(i,mod(j+step,N));
                end           
            end
        end   
        %imshow(T);
     end      
end