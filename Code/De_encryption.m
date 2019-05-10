function  [P,O1,O,L] = De_encryption(R0,R1,X,Y)
%DE_ENCRPTION 此处显示有关此函数的摘要
%   此处显示详细说明
    [M,N] = size(R1);
    %% 解密SxorS'
     for i = 1:M
         for j = 1:N
              O(i,j) = bitxor(R0(i,j),R1(i,j));
          end
     end
     O1=O;
     %imshow(O);figure;
     %% 解密第二次异或运算
     for i=2:M
        for j = 1:N
                O(i,j) = bitxor(O(i,j),O(i-1,j));
         end
     end
     %imshow(O);figure;
     %% 解密对角变换
     for i = 1:M
         for j = 1:N
             index = (i-1)*M+j;
             L(X(1,index),Y(1,index)) = O(i,j);
        end
    end
    %% 解密行移位
     for i = 1:M
         step = i-1;
         for j = 1:N
            if mod(j-step+N,N)==0
                 P(i,j) = L(i,N);
            else
                 P(i,j) = L(i,mod(j-step+N,N));
            end           
        end      
   end
end