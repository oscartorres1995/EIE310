% Dise�o de filtro multibanda FIR (5 bandas) con el m�todo �ptimo
% Banda 1 : 0 - 200 Hz; rechazo; mag = 0; ripple = -40 dB
% Banda 2 : 220 - 380 Hz; paso; mag = 1; ripple = 3 dB
% Banda 3 : 400 - 590 Hz; rechazo; mag = 0; ripple = -50 dB
% Banda 4 : 610 - 700 Hz; paso; mag = 0.5; ripple = 1 dB
% Banda 5 : 720 - 1000 Hz; rechazo; mag = 0; ripple = -60 dB
Fs = 2000; % frecuencia de muestreo
% Frec. l�mites de bandas; no se especifica la inicial ni la final
f = [200 220 380 400 590 610 700 720];
a = [0 1 0 0.5 0]; % amplitudes deseadas en las bandas
% Ripple en las bandas
r1 = 30; r2 = 3; r3 = 50; r4 = 1; r5 = 60;
% Desviaciones en las bandas
d1 = 10^(-r1/20);
d2 = (10^(r2/20)-1)/(10^(r2/20)+1);
d3 = 10^(-r3/20);
d4 = (10^(r4/20)-1)/(10^(r4/20)+1);
d5 = 10^(-r5/20);
dev = [d1 d2 d3 d4 d5]; % vector de desviaciones
[O, fo, ao, w] = remezord(f, a, dev, Fs); % estima orden del filtro
O % despliega orden = (N-1)
b = remez(O, fo, ao, w); % dise�a el filtro
% Respuesta de frecuencia obtenida
[H, f] = freqz(b, 1, 1024, Fs);
plot(f, 20*log10(abs(H))); xlabel('Hz'); ylabel('dB'); grid
