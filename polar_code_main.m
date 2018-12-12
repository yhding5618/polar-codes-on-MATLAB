clc
clear
close all

N=8;  % Channels
n=log2(N);
A=[4 6 7 8];  % information bit
u_A=[1 1 0 1];  % information vetor
AC=[1 2 3 5];  % frozen bit
u_AC=[0 0 0 0];  % frozen vector
snr=6;

[u,x] = polar_code_encoder(n,A,u_A,AC,u_AC);
y = polar_code_channel(N,x,snr);
u_e = polar_code_SC_decoder(n,N,y,AC);

if(u==u_e)
    disp('correct');
else
    disp('error');
end