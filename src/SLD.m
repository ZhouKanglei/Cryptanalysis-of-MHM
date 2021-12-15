function R = SLD(O, S, M, N)
%% Function: the second level of operation through the XOR operation
    [M, N] = size(O);
    for j = 1:N
        R(1, j) = bitxor(O(1, j), S(1, j));
    end
    
    for i=2 :  M
        for j = 1 : N
            R(i, j) = bitxor(bitxor(O(i, j), O(i - 1, j)), S(i, j));
        end
    end
    
end