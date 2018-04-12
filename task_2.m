% 1.
filename = 'Sa5.tx';
h = 0.0259997323276474;
x = fscanf(fopen(filename, 'r'), '%f')';
N = numel(x);

% 2-4.
X = fft2(x);
plot(2 * abs(X(1:N/2)) / N);
waitforbuttonpress;
% saveas(gcf, 'pic_1.png');

% 5.
freqs = get_frequencies(X, h);
angulars = freqs * 2 * pi;
disp(freqs);
disp(angulars);
waitforbuttonpress;

% 7.
noise = 2 * rand(1, N) - 1; % amp = 1, -1 < noise(i)< 1
x_noised_1 = x + noise;
X_noised_1 = fft2(x_noised_1);
plot(2 * abs(X_noised_1(1:N/2)) / N);
waitforbuttonpress;
freqs_noised_1 = get_frequencies(X_noised_1, h);
disp(freqs_noised_1);

amp = 3.1;
noise = amp * (2 * rand(1, N) - 1); % amp = 3, -3 < noise(i)< 3
x_noised_2 = x + noise;
X_noised_2 = fft2(x_noised_2);
plot(2 * abs(X_noised_2(1:N/2)) / N);
waitforbuttonpress;
% saveas(gcf, 'pic_2.png');
freqs_noised_2 = get_frequencies(X_noised_2, h);
disp(freqs_noised_2);

amp = 3.2;
noise = amp * (2 * rand(1, N) - 1); % amp = 3, -3 < noise(i)< 3
x_noised_3 = x + noise;
X_noised_3 = fft2(x_noised_3);
plot(2 * abs(X_noised_3(1:N/2)) / N);
waitforbuttonpress;
% saveas(gcf, 'pic_3.png');
freqs_noised_3 = get_frequencies(X_noised_3, h);
disp(freqs_noised_3);

% 9.
new_x = add_two_harmonics(80, 100, 0.8, x, h, N);
new_X = fft2(new_x);
plot(2 * abs(new_X(1:N/2)) / N);
title('First try with harmonics');
waitforbuttonpress;

% 10.
new_x = add_two_harmonics(119, 120, 0.8, x, h, N);
new_X = fft2(new_x);
plot(2 * abs(new_X(1:N/2)) / N);
title('Closest but not violating Nyqist condition');
waitforbuttonpress;
% saveas(gcf, 'pic_4.png');

% 11.
for second_omega = 121:130
    new_x = add_two_harmonics(119, second_omega, 0.8, x, h, N);
    new_X = fft2(new_x);
    plot(2 * abs(new_X(1:N/2)) / N);
    title(second_omega);
    waitforbuttonpress;
end;

new_x = add_two_harmonics(119, 126, 0.8, x, h, N);
new_X = fft2(new_x);
plot(2 * abs(new_X(1:N/2)) / N);
title('Order of peaks changed after aliasing');
waitforbuttonpress;
% saveas(gcf, 'pic_5.png');

% 12.
x2 = x(2:2:512);
for omega = 51:70
    new_x = x + cos(omega * (0:h:h*(N-1)));
    new_X = fft2(new_x);
    title(omega);
    subplot(2, 1, 1);
    plot(2 * abs(new_X(1:N/2)) / N);
    title('Big signal');
    new_x2 = x2 + cos(omega * (0:2*h:h*(N-1)));
    X2 = fft2(new_x2);
    subplot(2, 1, 2);
    plot(2 * abs(X2(1:N/4)) / (N / 2));
    title('Cropped signal');
    if omega == 62
        % saveas(gcf, 'pic_6.png');
    end;
    waitforbuttonpress;
end;

