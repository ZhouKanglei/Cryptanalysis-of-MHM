function B = De_BPS(R0, X, Y)
    [M, N] = size(R0);
    %% Solve the boundary replacement map
    if exist(['keys/Bp_', num2str(M), '.mat'], 'file')  
        load(['keys/Bp_', num2str(M), '.mat']);
    end
    for k = 1 : 256   
        if exist(['keys/Bp_', num2str(M), '.mat'], 'file')  
            R1 = Bp{k};
            P = De_encryption(R0, R1, X, Y);% Return the decrypted diffused image
        else
            I1 = zeros(M, N) + k - 1;
            R1 = encryption( I1 );
            P = De_encryption(R0, R1, X, Y);% Return the decrypted diffused image
        end
        B(1, k) = P(1, 1);
    end
end