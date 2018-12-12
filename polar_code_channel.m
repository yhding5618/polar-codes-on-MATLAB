function [ y ] = polar_code_channel(N,x,snr)
% Description:
%   channel simulation
% input:
%   N: length of codeword
%   x: input codeword
%   snr: Signal Noise Ratio of AWGN
% output:
%   y: output codeword

    y=zeros(1,N);
    % BPSK mapping
    for i=1:N
        if(x(i)==0)
            y(i) = 1; % 0-->1
        else
            y(i) = -1; % 1-->-1
        end
    end
    % AWGN
    y=awgn(y,snr);
end

