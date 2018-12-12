function LLR = polar_code_initLLR(n,N,y)
% Description:
%   init log-likelihood ratio
% input:
%   n: number of level
%   N: length of codeword
%   y: undecoded codeword
% output:
%   LLR: log-likelihood ratio

    LLR = zeros(N,n+1);
    LLR(:,1) = y;
end

