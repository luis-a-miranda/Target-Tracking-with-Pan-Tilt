Primeiro coorer no matlab o ficheiro principal.m para criar os ganhos para o pole placement, lqr, observer e a trajectoria.
So depois correr o simulink ja que contem variaveis que s�o do workspace.
Para mudar entre trajectoria rectilinea e circular � preciso no script principal.m comentar uma das fun�oes e deixar a 
outra respectivamnete. Elas encontram se no fim do script assinaladas ([pdx,pdy,pdz,vdx,vdy,vdz,t] = faz_trajectoria();
e [pdx,pdy,pdz,wdx,wdy,wdz,t] = circular_trajectory;)
