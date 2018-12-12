function [HB] = polar_code_updateHB_R(n,N,stage,LLR,HB,AC)
% Description:
%   Calculate beta_right
% input:
%   n: number of level
%   N: length of codeword
%   stage: current processing stage
%   LLR: log-likelihood ratio
%   HB: estimated hard bits
%   AC: frozen bit
% output:
%   HB: estimated hard bits

    Ns = 2^(n-stage+1);
    for j=1:Ns:N
        for i=j+Ns/2:j+Ns-1
            if(stage==n&&ismember(i,AC))
                HB(i,stage+1) = 0;
            elseif(LLR(i,stage+1)>=0)
                HB(i,stage+1) = 0;
            else
                HB(i,stage+1) = 1;
            end
        end
    end
end

