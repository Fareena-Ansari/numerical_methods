%%FAREENA ANSARI
%%214104611

% Problem 3: AUTOCORRELATION FUNCTION OF A SINE WAVE

t=7;
f=2;
A=1;
theta=-10:0.523598:10;
y=A*sin((2*pi*f)*t + theta);
[YAUTO,tau] = xcorr(y,'coeff');
plot(theta,y,'r--*')
hold on 
plot(tau,YAUTO,'b')
legend({'SINE WAVE','AUTOCORRELATION'});
