function T=HCST(B,C,M,N,I)
%% �������ܣ���λ���ң�HCST
%��ʽ������B��CΪ�����С������У�IΪͼ�����M��NΪ������
%���أ�T1Ϊ����λ����TΪ����λ����
 %% ����λ�任
     %imshow(I);
     [M,N] = size(I);
     T1 = I;
     for i = 1:N    
        step=B(1,i);
        if mod(step,2)==0%����ѭ������step����
            for j = 1:M
                if mod(j-step+M,M)==0
                    T1(j,i) = I(M,i);
                else
                    T1(j,i) = I(mod(j-step+M,M),i);
                end
            end
        else%����ѭ������step����
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
     
   %% ����λ�任
     for i = 1:M
        step=C(1,i);
        if mod(step,2)==0%����ѭ������step����
            for j = 1:N
                if mod(j-step+N,N)==0
                    T(i,j) = T1(i,N);
                else
                    T(i,j) = T1(i,mod(j-step+N,N));
                end
            end
        else%����ѭ������step����
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