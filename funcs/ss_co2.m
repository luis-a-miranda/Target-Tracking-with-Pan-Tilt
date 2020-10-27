A = [0 657.92 0;0 0 1;0 -657.92 -40];
B = [0;0;1];
C = [1 0 0];
D = [0 0 0; 0 0 0; 0 0 0];

%LQR

N=0;
R=1;
Q = [1.7 0 0;0 1 0;0 0 1];

[K] = lqr(A,B,Q,R,N);

%State Observer (pólos 5 vezes mais rápido)
%pólos em s=-50

funcde=s^3+150*s^2+7500*s+125000;


