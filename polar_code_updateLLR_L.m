function [LLR] = polar_code_updateLLR_L(n,N,stage,LLR)
% Description:
%   Calculate alpha_left
% input:
%   n: number of level
%   N: length of codeword
%   stage: current processing stage
%   LLR: log-likelihood ratio
% output:
%   LLR: log-likelihood ratio

    Ns = 2^(n-stage+1);
    for j=1:Ns:N
        for i=j:j+Ns/2-1
            p = LLR(i,stage); %alpha_i
            q = LLR(i+Ns/2,stage); %alpha_(i+Ns/2)
            LLR(i,stage+1) = sign(p)*sign(q)*min([abs(p),abs(q)]);
        end
    end
end

