function [u_e] = polar_code_SC_decoder(n,N,y,AC)
% Description:
%   polar code successive cancellation encoder
% input:
%   n: number of level
%   N: length of codeword
%   y: undecoded codeword
%   AC: frozen bit
% output:
%   u_e: estimate of codeword

    LLR = polar_code_initLLR(n,N,y);
    HardBits = polar_code_initHB(n,N,LLR);
    for stage=1:n
        LLR = polar_code_updateLLR_L(n,N,stage,LLR);    % Calculate alpha_left
        HardBits = polar_code_updateHB_L(n,N,stage,LLR,HardBits,AC);    %Calculate beta_left
        LLR = polar_code_updateLLR_R(n,N,stage,LLR,HardBits);    % Calculate alpha_right
        HardBits = polar_code_updateHB_R(n,N,stage,LLR,HardBits,AC);    %Calculate beta_right
    end
    u_e = HardBits(:,n+1)';
end

