clc;
clear;
close all;

% Parameters
fs = 400; 
T = 1/fs; 
t = 0:T:1;
f = -500:0.01:500; 

% Filter H(f)
W = 200; 
H = zeros(size(f));
H(f > -W & f < W) = 1;
figure;
plot(f, H, 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('H(f)');
title('Lowpass Filter (fc=0, W=200 Hz)');
grid on;

% Signal x(t)
x = cos(200*pi.*t) + 0.2*cos(700*pi.*t);
figure;
plot(t, x, 'y');
xlabel('Time (s)');
ylabel('x(t)');
title('x(t) Signal');
grid on;

% Fourier Transform of the Signal
X = fft(x); 
N = length(X);
frequencies = linspace(-fs/2, fs/2, N);

% Plot the spectrum of the signal
figure;
plot(frequencies, abs(fftshift(X))/N, 'g');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
title('Spectrum of x(t)');
grid on;

% Low-pass Filtering in Frequency Domain
H_fft = zeros(1, N);
H_fft(abs(frequencies) < W) = 1;
Y = H_fft .* fftshift(X); 
y_filtered = ifft(ifftshift(Y));

% Plot Filtered Signal
figure;
subplot(2,1,1);
plot(t, real(y_filtered), 'r', 'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('y(t)');
title('Filtered Signal y(t)');
grid on;

subplot(2,1,2);
plot(frequencies, abs(Y)/N, 'b', 'LineWidth', 1.2);
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
title('Spectrum of Filtered Signal y(t)');
grid on;
