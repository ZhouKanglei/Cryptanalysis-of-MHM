function [ I P Err ] = attack( R, I0 )
    %% Plain image
    [M, N] = size(R);
    
    I_0 = zeros(M, N);
    R0 = encryption( I_0 ); % Cipher image of full zero image£¬S xor S'
    R0 = uint8( R0 );

    U = imread(['images/permutation/U_cipher_',num2str(M),'.png']); % 256-bit high
    V = imread(['images/permutation/V_cipher_',num2str(M),'.png']); % 256-bit middle
    W = imread(['images/permutation/W_cipher_',num2str(M),'.png']); % 256-bit low
    %% Attack process
    tic;
    [X  Y] = DST_map(R0);
    toc;
    tic;
    BP = [1:M];
    BP = De_BPS(R0, X, Y);
    toc;
    [P, PP, O1, O, L] = De_difusion(R0, R, BP, X, Y);
    P1 = De_difusion(R0, U, BP, X, Y);
    P2 = De_difusion(R0, V, BP, X, Y);
    P3 = De_difusion(R0, W, BP, X, Y);
    I = De_confusion(P, P1, P2, P3);
    toc;
    %% The error analysis
    num = 0;
    Err = zeros(M, N);
    for i = 1:M
        for j = 1:N
            if I0(i, j) ~= I(i, j);
                Err(i, j) = 255;
                num = num + 1;
            end
        end
    end
    num
end