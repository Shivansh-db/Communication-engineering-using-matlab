clc;
clear vars;
clear all;
%%
Am=input('Enter the Amplitude of the Message Signal');
Ac=input('Enter the Amplitude of the Carrier Signal');
fm=input('Enter the frequency of the Message Signal');
fc=input('Enter the frequency of the Carrier Signal');
m=Am/Ac; %Modulation Index : m<1= Undermodulated and m>1= Overmodulated
fs=2200;%sampling frequency
Ts=1/fs;%sampling period
N=10000;%number of samples
t=[0:Ts:N*Ts-Ts];%time axis
f=[-fs/2:fs/N:fs/2-fs/N];%frequency axis

%%
%Generating Message Signal
m=Am*sin(2*pi*fm*t);
%Generating Carrier Signal
c=Ac*sin(2*pi*fc*t);
%Generating AM Signal
AM=((Ac+m).*sin(2*pi*fc*t));
%%
%Plotting Message Signal
figure;
plot(t,m);
hold on 10;
plot(t,AM);
legend('Message','Amplitude Modulation');
%%
%Frequency Domain Analysis
M=fft(m);
C=fft(c);
AM2=fft(AM);
figure;
stem(f,fftshift(abs(M)));
title('Message Signal');
figure;
stem(f,fftshift(abs(C)));
title('carrier Signal');
figure;
stem(f,fftshift(abs(AM2)));
title('AM Signal');