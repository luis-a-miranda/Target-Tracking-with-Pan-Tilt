clear all

%System Computation
A = [0 657.92 0; 0 0 1; 0 -657.92 -40];
B = [0; 0; 1];
C = [1 0 0];
D = 0;
sys = ss(A,B,C,D);
[numer,denom] = ss2tf(A,B,C,D);
ft = tf(numer,denom);
ft_feedback = feedback(ft,1);

%Observability and controlability
Cont = ctrb(sys);
Obs = obsv(sys);

%Ackermans formula for pole placement
J =[-11.3+i*11.7 -11.3-i*11.7 -17.6 -15] ; %insert desired poles (also [-20 -15 -10 -5])
%K = acker(A,B,J);

Ahat = [A zeros(3,1);-C 0];
Bhat = [B;0];
Khat = acker(Ahat,Bhat,J);
Chat = [C 0];

%LQR
Q = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 100];
R = 0.01;
N = 0;
[K_lqr, P_lqr, e_lqr] = lqr(Ahat,Bhat,Q,R,N);

%State Observer

J_obs = [-50 -51 -52];
L = place (A',C',J_obs);

%Creating rectilinear trajectory
[pdx,pdy,pdz,vdx,vdy,vdz,t] = faz_trajectoria();

%Creating circular trajectory
%[pdx,pdy,pdz,wdx,wdy,wdz,t] = circular_trajectory;
