function O = DST(D,M,N)
%% function: diagonal scan conversion
% formal parameter: D is the result of the first operation through xor operation, and M and N are the number of columns and columns
% Output value: the result of a diagonal scan conversion
%% transforms a two-dimensional matrix diagonal into a one-dimensional vector
    i = 1;
    j = 1;
    c = 1;
    [M,N] = size(D);
    E(1,1) = D(1,1);
    while ~(i==M & j==N)
       
        if i+1<=M
            c=c+1;
            E(1,c) = D(i+1,j);% Down
            i = i+1;
        else if j+1<=N 
                c=c+1;
                E(1,c)  = D(i,j+1);% Right
                j = j+1;
            else 
                break;
            end   
        end 
        
        while i-1>=1 & j+1<=N
            if i-1>=1 & j+1<=N
                 c=c+1;
                 E(1,c)  = D(i-1,j+1);% Up
                 i = i-1;
                 j = j+1;
            end
        end
        
        if j+1<=N
            c=c+1;
            E(1,c) = D(i,j+1); % Right
            j = j+1;
        else if i+1<=M
                c=c+1;
                E(1,c) = D(i+1,j); % Down
                i = i+1;
            else
                break;
            end
        end
        
        while i+1<=M&j-1>=1
             if i+1<=M&j-1>=1
                 c=c+1;
                 E(1,c) = D(i+1,j-1);% Down
                 i = i+1;
                 j = j-1;
             end
        end  
    end
%% Transform a 1D vector into a 2D matrix in the form of rows
   for i = 1:M
        for j = 1:N
            O(i,j) = E(1,(i-1)*N+j);
        end
   end
   
end