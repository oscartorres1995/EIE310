A=1; B=9; C=2; D=1; E=4;
t= 0 : 0.3 : 30; v= exp(-((B+A)/(2*C*(D+E)))*t).*sin(t);
subplot 121; plot(t, v); title('PLOT');
xlabel('Tiempo (seg)'); ylabel('Volts'); grid;
subplot 122; stem(t, v); title('STEM');
xlabel('Tiempo (seg)'); ylabel('Volts'); grid;