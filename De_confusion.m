function I = De_confusion(P,P1,P2,P3)
%% Ω‚√‹÷√¬“
    [M,N] = size(P);
    for i = 1:M
        for j = 1:N
            sum = uint32(P1(i,j))*256*256+uint32(P2(i,j))*256+uint32(P3(i,j));
            if mod(sum,N)<N/2
                x = round(sum/N)+1;
            else
                x = round(sum/N);
            end
            if x == N+1
                x = N;
            end
            y = mod(sum,N)+1;
            I(x,y) = P(i,j);
%         I(uint16(P2(i,j))+1,uint16(P3(i,j))+1) = P(i,j);
        end
        %imshow(I);
    end
end