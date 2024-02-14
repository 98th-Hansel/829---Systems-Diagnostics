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

disp('****************************')

%% noise free ETFE & SPA %%

z = [y u'];
N = 1500;
M = 800;
g1 = etfe(z,M,N,Ts);
figure;
bode(g1)
hold on

z = [y u'];
N = 1500;
M = 800;
w = linspace(pi/(N/Ts),pi/Ts,N);
maxsize= [];
g2 = spa(z,M,w,maxsize,Ts);
bode(g2)
legend('ETFE method - noise-free','SPA method - noise-free')

%% Noisy ETFE and SPA 2%%

z = [yn u'];
N = 1500;
M = 800;
g1n = etfe(z,M,N,Ts);
figure;
bode(g1n)
hold on

z = [yn u'];
N = 1500;
M = 800;
w = linspace(pi/(N/Ts),pi/Ts,N);
maxsize= [];
g2n = spa(z,M,w,maxsize,Ts);
bode(g2n)
legend('ETFE method - noise-free','SPA method - noise-free')

%Part 2%
%% Model from noise-free data %%

ui = u(1:1000);   yi = y(1:1000);   yni = yn(1:1000);
uv = u(1001:end);   yv = y(1001:end);   ynv = yn(1001:end);

datai = iddata(yi,ui',Ts);
nb = 2;
nf = 2;
nk = 1;
M_OE = oe(datai,[nb nf nk]);

present(M_OE)

datav = iddata(yv,uv',Ts);
figure;
compare(datav,M_OE,1)
disp('***********************************')
mc = d2c(M_OE,'zoh')
figure;
pzmap(mc)
title('pole-zero map of G(s) - noise-free data')
disp('***********************************')

%% OE Model from noisy Data %%

datani = iddata(yni, ui', Ts);
nb = 2;
nf = 2;
nk = 1;
Mn_OE = oe(datani, [nb nf nk]);

present(Mn_OE)

datanv = iddata(ynv,uv',Ts);
figure;
compare(datanv,Mn_OE,1)
disp('**********************************************************')

mcn = d2c(Mn_OE,'zoh')
figure;
pzmap(mcn)
title('ple-zero map of G(s) - noisy data')
disp('**********************************************************')

%% Part 3 %%