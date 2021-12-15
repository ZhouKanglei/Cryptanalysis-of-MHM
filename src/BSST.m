function [L P] = BSST(T,B,M,N)
%% function: boundary pixel replacement and shift row transform
% Formal parameter: T is the result of mixed chaotic transformation, B is the column chaotic sequence, M and N are the number of rows and columns
% output parameter: P is the result of boundary pixel replacement and shift row transform
%% Border pixel substitution: replaces the first and last row of T
    for i = 1:N
            T(1,i) = B(1,uint16(T(1,i))+1);
            T(M,i) = B(1,uint16(T(M,i))+1);
    end
    P = T;

 %% Shift row transform: loop left shift of row I by i-1 step
     for i = 1:M
         step = i-1;
         for j = 1:N
                if mod(j+step,N)==0
                    L(i,j) = P(i,N);
                else
                    L(i,j) = P(i,mod(j+step,N));
                end           
         end      
     end
     
end