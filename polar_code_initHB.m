function [HB] = polar_code_initHB(n,N,LLR)
% Description:
%   init estimated hard bits
% input:
%   n: number of level
%   N: length of codeword
%   LLR: log-likelihood ratio
% output:
%   HB: estimated hard bits

    HB = zeros(N,n+1);
    for i=1:N
        if(LLR(i,1)>=0)
            HB(i,1) = 0;
        else
            HB(i,1) = 1;
        end
    end
end

