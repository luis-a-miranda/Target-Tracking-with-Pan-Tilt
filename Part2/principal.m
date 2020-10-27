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
J = [-20 -15 -10]; %insert desired poles (also trie [-11.3+i*11.7 -11.3-i*11.7 -17.6] to eliminate overshoot)
K = acker(A,B,J);

%Creating trajectory (rectilinear for now)
[pdx,pdy,pdz,vdx,vdy,vdz,t] = faz_trajectoria();