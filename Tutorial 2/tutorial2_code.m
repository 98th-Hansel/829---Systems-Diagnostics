%% Collect I/O Data %%

flag = '10';

N = 1500;
K = 60;
A = 4;
u = A*dprbs(N,K);

figure();
Nflag = '0';
[y,Ts] = tutorial2(u,flag,Nflag);

figure();
Nflag = '1';
[yn,Ts] = tutorial2(u,flag,Nflag);
disp('**************************************************')

%% Recover Impulse Response %%

%Deconv Method noise-free%

figure;
w1 = impweigh(u,y);
L = 100;
xlim([0 L])
legend('noise-free data (DE-CONV)')

%Correlation Method noise-free%

data = iddata(y,u',Ts);
L = 200;
figure;
w2 = correl(data,L);
xlim([0 L/40])
legend('noise-free data (CORREL)')

z = [y u'];
L = 200;
figure;
w3 = cra(z,L);
xlim([0 L/2])
legend('noise-free data (CRA)')

%% Recover impulse noisy%%
%Deconv Method noisy%
figure;
wn1 = impweigh(u,yn);
L = 100;
xlim([0 L])
legend('noise-free data (DE-CONV)')

%Correlation Method noisy%

data = iddata(yn,u',Ts);
L = 200;
figure;
wn2 = correl(data,L);
xlim([0 L/40])
legend('noisy data (CORREL)')

z = [yn u'];
L = 200;
figure;
wn3 = cra(z,L);
xlim([0 L/2])
legend('noisy data (CRA)')

%% Part 1 Hanekl Matrix Test %%

nk = 13;
disp('  ')
disp('***************** DE-CONVOLUTION noise-free data **************')
figure;
subplot(121)
hanktest(w1,nk,0);
legend('noise-free data (DE-CONV)')
subplot(122)
hanktest(w1,nk,1);

disp('  ')
disp('***************** CORREL noise-free data **************')
figure;
subplot(121)
hanktest(w2,nk,0);
legend('noise-free data (CORREL)')
subplot(122)
hanktest(w2,nk,1);

disp('  ')
disp('***************** CRA noise-free data **************')
figure;
subplot(121)
hanktest(w3,nk,0);
legend('noise-free data (CRA)')
subplot(122)
hanktest(w3,nk,1);

%% ORDER SELECTION %%

nk = 13;
disp('  ')
disp('***************** DE-CONVOLUTION noisy data **************')
figure;
subplot(121)
hanktest(wn1,nk,0);
legend('noisy data (DE-CONV)')
subplot(122)
hanktest(wn1,nk,1);

disp('  ')
disp('***************** CORREL noisy data **************')
figure;
subplot(121)
hanktest(wn2,nk,0);
legend('noisy data (CORREL)')
subplot(122)
hanktest(wn2,nk,1);

disp('  ')
disp('***************** CRA noisy data **************')
figure;
subplot(121)
hanktest(wn3,nk,0);
legend('noisy data (CRA)')
subplot(122)
hanktest(wn3,nk,1);

%% Recover STEP RESPONSE %%

%noise free%

u1 = ones(size(w1));
figure;
ys1 = decresp(w1,u1);
L = 200;
xlim([0 L])
legend('noise-free data (DE-CONV)')

u2 = ones(size(w2));
figure;
ys2 = decresp(w2,u2);
L = 200;
xlim([0 L])
legend('noise-free data (CORREL)')

u3 = ones(size(w3));
figure;
ys3 = decresp(w3,u3);
L = 200;
xlim([0 L])
legend('noise-free data (CRA)')

%%
%noisy%

un1 = ones(size(wn1));
figure;
ys1 = decresp(wn1,un1);
L = 200;
xlim([0 L])
legend('noisy data (DE-CONV)')

un2 = ones(size(wn2));
figure;
ys2 = decresp(wn2,un2);
L = 200;
xlim([0 L])
legend('noisy data (CORREL)')

un3 = ones(size(wn3));
figure;
ys3 = decresp(wn3,un3);
L = 200;
xlim([0 L])
legend('noisy data (CRA)')

%% ********************************** PART 2 ********************************** %%

%% OE Model from noise-free data %%

ui = u(1:1000);  yi = y(1:1000);   yni = yn(1:1000);
uv = u(1001:end);  yv = y(1001:end);  ynv = yn(1001:end);

datai= iddata(yi,ui',Ts);
nb = 2;
nf = 2;
nk = 13;
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

%% OE Model from noisy data %%

datai= iddata(yni,ui',Ts);
nb = 2;
nf = 2;
nk = 13;
M_OE = oe(datai,[nb nf nk]);

present(M_OE)

datav = iddata(ynv,uv',Ts);
figure;
compare(datav,M_OE,1)
disp('*************')
mc = d2c(M_OE,'zoh')
figure;
pzmap(mc)
title('pole-zero map of G(s) - noise-free data')
disp('*************')

%% *************************** Part 3 *********************** %%

Ts = 0.05;
nk = 13;
Td = (nk-1)*Ts;
Kdc = 0.7;
period = (46-20)*Ts;
wd = 2*pi/period;

zeta = 0.25;                   %ESTIMATED MUST CHANGE IF RESULTS ARE BAD%
wn = wd/sqrt(1-zeta^2);
a = 1.6*zeta*wn;        %ESTIMATED MUST CHANGE IF RESULTS ARE BAD%

%second order with additional zero, maybe change if it doesnt work%
num = Kdc*wn^2*[1 a];
den = a*[1 2*zeta*wn wn^2];
Gs = tf(num,den,'IODelay',Td)

figure;
pzmap(Gs)
title('pole0zero map of G(s) - Part 3')

figure;
step(Gs)
disp('*****************************************************')

%% ********** %%

Gq = c2d(Gs,Ts);
[numd,dend,Ts] = tfdata(Gq,'v');

%OE model initializing
A = 1;
B = numd;
C = 1;
D = 1;
F = dend;
NoiseVariance = [];
M3_OE = idpoly(A,B,C,D,F,NoiseVariance,Ts,'IODelay',nk-1)

figure;
compare(datav,M_OE,M3_OE)