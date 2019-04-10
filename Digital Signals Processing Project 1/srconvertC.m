function E=srconvertC(in)

signal=in;
[B, A] = ellip(5,0.01,70,1/320);
Up = upsample(signal, 320);
filt = filter(B, A, Up);
E = downsample(filt, 147);
audiowrite('signal4.wav', E, 24000)
end