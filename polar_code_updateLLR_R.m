function [LLR] = polar_code_updateLLR_R(n,N,stage,LLR,HB)
% Description:
%   Calculate alpha_right
% input:
%   n: number of level
%   N: length of codeword
%   stage: current processing stage
%   LLR: log-likelihood ratio
%   HB: estimated hard bits
% output:
%   LLR: log-likelihood ratio

    Ns = 2^(n-stage+1);
    for j=1:Ns:N
        for i=j:j+Ns/2-1
            p = LLR(i,stage); %alpha_i
            q = LLR(i+Ns/2,stage); %alpha_(i+Ns/2)
            LLR(i+Ns/2,stage+1) = (1-2*HB(i,stage+1))*p+q;
        end
    end
end

