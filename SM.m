function S = SM(r,z0,M,N)
%% Generate sinusoidal chaotic sequence
% formal parameter: r is the parameter, z0 is the initial value, len is the length of the generated sequence
% return value: processed sinusoidal sequence
%% produces a sinusoidal sequence
    Z(1,1)=z0;
    pi=3.141592657;
    for i = 2:M*N
        Z(1,i) = r*sin(pi*Z(1,i-1));
    end
%% Modulus processing
    for i = 1:M
        for j = 1:N
            S(i,j) = mod(round(Z(1,(M-1)*i+j)*100000000),256);
        end
    end
end