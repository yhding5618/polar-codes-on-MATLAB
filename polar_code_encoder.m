function [u,x] = polar_code_encoder(n,A,u_A,AC,u_AC)
% Description:
%   polar code encoder
% input:
%   n: number of level
%   A: information bit
%   u_A: information vector
%   AC: frozen bit
%   u_AC: frozen vector
% output:
%   u: unencoded codeword
%   x: encoded codeword

    F=[1 0;1 1];
    F_n=F;
    for i=1:(n-1)
        F_n=kron(F_n,F);
    end
    I=eye(2^n);
    G_n=F_n;
% 	G_n=bitrevorder(F_n);  % not necessary
    u=u_A*I(A,:)+u_AC*I(AC,:);
    x=mod(u_A*G_n(A,:)+u_AC*G_n(AC,:),2);
end
