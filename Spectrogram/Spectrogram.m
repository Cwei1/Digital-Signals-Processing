% Cardy Wei
% Spectrogram

%% 1

fs = 5e6
mu = 4e9
tmax=200e-6;
t= 0:1/fs:tmax
x = cos(2* pi* mu * t.^2);

figure;
spectrogram(x, triang(256), 255, 256, fs, 'yaxis')

% 2
f1= mu*t
f2 = (1/(2*pi))*(4*pi*mu*t)
figure;
plot(t,f1)
figure;
plot(t,f2)

%f2 is the correct one

%3
mu2 = 1e10;
x = cos(2* pi* mu2 * t.^2);
figure;
spectrogram(x, triang(256), 255, 256, fs, 'yaxis')

%The slope of the ridge in this spectrogram is much higher and then it goes
%down again

%4
load s1.mat
load s5.mat

figure;
spectrogram(s5, triang(1024), 1023, 1024, fs, 'yaxis')
figure;
spectrogram(s1, triang(1024),1023, 1024, fs, 'yaxis')

%5
figure;
spectrogram(s5, triang(128), 127, 128, fs, 'yaxis')
figure;
spectrogram(s1, triang(128), 127, 128, fs, 'yaxis')
 
%6
load vowels.mat
figure;
plot(vowels);
[s1,f1,t1]=spectrogram(vowels, rectwin(256), 128, 1024, 8e3, 'yaxis');
out = estimate_signal(s1,1024)
figure;
plot(out);

%7

c=vowels(1:2:numel(vowels));
[s,f,t]=spectrogram(c, rectwin(256), 128, 1024, 8e3, 'yaxis');
o = estimate_signal(s,1024);
figure;
plot(vowels);
figure;
plot(o);


