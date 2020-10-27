function [pdx,pdy,pdz,vdx,vdy,vdz,t] = faz_trajectoria()

%% DEVERÁ CORRER ESTA FUNÇAO DE MODO A GUARDAR AS VARIAVEIS
% NA WORKSPACE SENAO O SIMULINK COM TRAJECTORIA NAO CORRE



%% Define uma trajectoria rectilinea que passa da pose 2 para a pose 3
%Notar que para um trajectoria no rasteirinho não faz sentido o valor no
%eixo vertical (z) mudar de uma posição para a seguinte
pi=[10; 10 ; 1];


pf=[7; 6 ; 1];


tf=30; %Tempo de trajectoria

% Assumindo velocidades iniciais e finais = 0
%determina-se a2 e a3 segundo as formulas da pág.164 do livro

norma=sqrt((pf(1)-pi(1))^2+(pf(2)-pi(2))^2+(pf(3)-pi(3))^2);

a2=3*norma/(tf^2);

a3=-2*a2/(3*tf);

t=0:.01:tf;

s=zeros(1,length(t));
v=zeros(1,length(t));

for i=1:length(t)
    s(i)=a2*t(i)^2+a3*t(i)^3;
    v(i)=2*a2*t(i)+3*a3*t(i)^2;
end

pdx=pi(1)+s*(pf(1)-pi(1))/norma;
pdy=pi(2)+s*(pf(2)-pi(2))/norma;
pdz=pi(3)+s*(pf(3)-pi(3))/norma;

vdx=v*(pf(1)-pi(1))/norma;
vdy=v*(pf(2)-pi(2))/norma;
vdz=v*(pf(3)-pi(3))/norma;

