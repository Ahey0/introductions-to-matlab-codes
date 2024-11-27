clc;
clear;
close all;

% Define the time range
t = linspace(-2, 2, 1000);

% Define the functions v(t), w(t), and y(t) using the sinc_func defined below
v_t = sinc_func(4 * t);       % v(t) = sinc(4t)
w_t = 2 * sinc_func(t / 2);   % w(t) = 2 * sinc(t/2)
y_t = v_t .* w_t;             % y(t) = v(t) * w(t)

% Calculate the Fourier Transforms
V_f = fftshift(fft(v_t)) / length(t);
W_f = fftshift(fft(w_t)) / length(t);
Y_f = fftshift(fft(y_t)) / length(t);

% Frequency range for plotting Fourier Transforms
fs = 1 / (t(2) - t(1));    % Sampling frequency
f = linspace(-fs/2, fs/2, length(t));

% Plotting
figure;

% Plot v(t)
subplot(3, 2, 1);
plot(t, v_t);
title('Time Domain - v(t) = sinc(4t)');
xlabel('t');
ylabel('v(t)');

% Plot w(t)
subplot(3, 2, 3);
plot(t, w_t);
title('Time Domain - w(t) = 2 * sinc(t/2)');
xlabel('t');
ylabel('w(t)');

% Plot y(t)
subplot(3, 2, 5);
plot(t, y_t);
title('Time Domain - y(t) = v(t) * w(t)');
xlabel('t');
ylabel('y(t)');

% Plot Fourier Transform of v(t)
subplot(3, 2, 2);
plot(f, abs(V_f));
title('Frequency Domain - |V(f)|');
xlabel('Frequency (f)');
ylabel('|V(f)|');

% Plot Fourier Transform of w(t)
subplot(3, 2, 4);
plot(f, abs(W_f));
title('Frequency Domain - |W(f)|');
xlabel('Frequency (f)');
ylabel('|W(f)|');

% Plot Fourier Transform of y(t)
subplot(3, 2, 6);
plot(f, abs(Y_f));
title('Frequency Domain - |Y(f)|');
xlabel('Frequency (f)');
ylabel('|Y(f)|');

% Adjust layout
sgtitle('Time and Frequency Domain Analysis');

% Define the custom sinc function at the end of the script
function y = sinc_func(x)
    y = ones(size(x));  % Initialize output with ones (for x = 0 cases)
    non_zero = x ~= 0;  % Logical index for non-zero elements
    y(non_zero) = sin(pi * x(non_zero)) ./ (pi * x(non_zero));  % Apply sinc for non-zero x
end
