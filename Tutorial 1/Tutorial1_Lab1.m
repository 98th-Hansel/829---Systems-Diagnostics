%% Collect I/O Data%%

flag = '10';

N = 1500;
K = 1;
A = 9;
u = A*dprbs(N,K);

figure();
Nflag = '0';
[y,Ts] = tutorial1(u,flag,Nflag);

figure();
Nflag = '1';
[yn,Ts] = tutorial1(u,flag,Nflag);

disp('*************')

%% Estimate Requency Response 
z = [y u'];
N= 1500;
M = 800;
g1= etfe(z,M,N,Ts);
figure;
bode(g1)
hold on

z = [y u'];
N = 1500;
M = 500;
w = linspace(pi/(N/Ts),pi/Ts,N);
maxsize = [];
g2 = spa(z,M,w,maxsize,Ts);
bode(g2)
legend('ETFE method - noise-free','SPA method - noise-free')

%% Part 2
% OE Model from noise-free data 
ui = u(1:1000);  yi = y(1:1000);   yni = yn(1:1000);
uv = u(1001:end);  yv = y(1001:end);  ynv = yn(1001:end);

datai= iddata(yi,ui',Ts);
nb = 2;
nf = 2;
nk = 1;
M_OE = oe(datai,[nb nf nk]);

present(M_OE)

datav = iddata(yv,uv',Ts);
figure;
compare(datav,M_OE,1)
disp('*************')
mc = d2c(M_OE,'zoh')
figure;
pzmap(mc)
title('pole-zero map of G(s) - noise-free data')
disp('*************')

%%  OE Model from noisy data 
datani = iddata(yni,ui',Ts);
nb = 2;
nf = 2;
nk = 1;
Mn_OE = oe(datani,[nb nb nk]);

present(Mn_OE)

datanv = iddata(ynv,uv',Ts);
figure;
compare(datanv,Mn_OE,1)
disp('******************************')

mcn = d2c(Mn_OE,'zoh')
figure;
pzmap(mcn)
title('pole-zero map of G(s) - noisy data')
disp('*******************************')

%% Part 3
% Transfer Function Model
Mr = 1.29;
Kdc = 0.849;
wr = 2.18;

% Mr = Kdc*(1/2*zeta*sqrt(1-zeta^2)))
zeta_vec = roots([4 0 -4 0 (Kdc/Mr)^2])
%%
zeta = 0.3515;

wn = wr/sqrt(1-2*zeta^2);

num = [Kdc*wn^2];
den = [1 2*zeta*wn wn^2];
sys = tf(num,den)

figure;
pzmap(sys)
title('pole-zero map of G(s) - Part 3')

disp('*********************************')

%%
sysd = c2d(sys,Ts);
[numd, dend,Ts] = tfdata(sysd,'V');

A = 1;
B = numd;
C = 1;
D = 1;
F = dend;
NoiseVariance = [];
M3_OE = idpoly(A,B,C,D,F,NoiseVariance,Ts)

figure;
compare(datav,M_OE,M3_OE)

