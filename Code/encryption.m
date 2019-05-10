function [ R, O, D, L, T ] = encryption( I )
    %% initialization parameters
    init;
    %%
    [M, N] = size(I);
    len = max(M, N);
    H = MHM(b1, b2, x0, y0, len); % Modified Henon map
    B = H(1, [1 : N]);                      % Chaotic column sequence
    save('B.mat', 'B');
    C = H(2, [1 : M]);                      % Chaotic row sequence
    T = HCST(B, C, M, N, I);           % Mixed chaotic transformation
    [L P] = BSST(T, B, M, N);          % Boundary pixel replacement and shift row transforms
    S = SM(r, z0, M, N);                 % A sequence that produces a sinusoidal mapping
    D = FLD(S, L, M, N);                 % The first level diffusion operation by the XOR operation
    O = DST(D, M, N);                   % Diagonal scan conversion
    R = SLD(O, S, M, N);                % The second level diffusion operation by the XOR operation

end