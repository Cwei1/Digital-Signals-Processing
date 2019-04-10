%% Cardy Wei
%Professor Keene
%DSP Proj 

% Located in srconvertC
% function E=srconvertC(in)
% 
% signal=in;
% [B, A] = ellip(5,0.01,70,1/320);
% Up = upsample(signal, 320);
% filt = filter(B, A, Up);
% E = downsample(filt, 147);
% audiowrite('signal4.wav', E, 24000)
% end

%Located in srconvert
%function out=srconvert(in)
% 
% signal=in;
% 
% Rp=(10^(0.01/20)-1); %Passband Ripple (undo 20log)
% Rst=10^(-100/20); %Stopband Ripple
% 
% filt1=firceqrip(250, 1/2, [Rp, Rst],'passedge');
% filt2=firceqrip(250, 1/5, [Rp, Rst],'passedge');
% 
% Up=upsample(signal, 5);
% res=fftfilt(filt2, Up);
% Up2=upsample(res, 2);
% res=fftfilt(filt1, Up2);
% Up3=upsample(res, 2);
% res=fftfilt(filt1, Up3);
% Up4=upsample(res, 2);
% res=fftfilt(filt1, Up4);
% Up5=upsample(res, 2);
% res=fftfilt(filt1, Up5 );
% Up6=upsample(res, 2);
% res=fftfilt(filt1, Up6);
% Up7=upsample(res, 2);
% res=fftfilt(filt1, Up7);
% 
% out = downsample(res, 147);
% audiowrite('signal4.wav', out*100, 24000)
% end

%% Multistaging
y=srconvert([1 zeros(1,3000)]);
verify(y);

%% Basic 
y=srconvertC([1 zeros(1,3000)]);
verify(y);
