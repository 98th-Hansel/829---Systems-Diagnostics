%% Collect I/O Data%%

flag = '42';

N = 5000;
K = 80;
A = 2;
u = A*dprbs(N,K);

[y1,Ts] = process_PEM(u,flag);

mean(y1)

DC = 2;
y = y1 - DC;
u=vector(u,'col');
y=vector(y,'col');
datad=iddata(y,u,Ts)
figure()
idplot(datad(1:500))
title('Display first 500 samples of I/O data and check for saturation')
disp('*************')

%% ETFE and SPA %%
z = [y u];
N= 5000;
M = 300;
g1= etfe(z,M,N,Ts);
figure;
bode(g1)
hold on

z = [y u];
N = 5000;
M = 300;
w = linspace(pi/(N/Ts),pi/Ts,N);
maxsize = [];
g2 = spa(z,M,w,maxsize,Ts);
bode(g2)
legend('ETFE method','SPA method')

%% Correl %%
data = iddata(y,u,Ts);
L = 200;
figure;
w2 = correl(data,L);
xlim([0 L/40])
legend('noisy data (CORREL)')

L_CRA = 200;
figure;
w3 = cra(data,L_CRA);
xlim([0 L_CRA/2])
legend('CRA')

%% Hank Test CRA%%
disp('  ')
disp('***************** CRA  **************')
figure;
subplot(121)
nk = 16;
hanktest(w3,nk,0);
legend('noise-free data (CRA)')
subplot(122)
hanktest(w3,nk,1);

%% create new data set %%

flag = '42';

figure(1);
[y1_new,Ts] = process_PEM(u,flag);

DC = 2;
y_new = y1_new - DC;
u=vector(u,'col');
y_new=vector(y_new,'col');
datad_new=iddata(y_new,u,Ts)
figure(1)
idplot(datad_new(1:500))
title('Display first 500 samples of I/O data and check for saturation')
disp('*************')

%% OE Model %%

datai = datad(1:4700);
datav = datad_new(1:4700);
M_oe = oe(datai, [2 2 16])
present(M_oe)
figure()
compare(datav,M_oe)

sys = d2c(M_oe, 'zoh')
apple = zpk(sys)
figure;
pzmap(apple)
title('pole0zero map of Apple')
figure;
step(apple)

%% Validate the Model %%
figure;
resid(M_oe,datav);
legend('Noise 1')
res1 = resid(M_oe,datav);
r1 = res1.y;
[S1,x1] = chisq(20,r1,100),grid on

uv = datav.u;
res = get(res1,'y');
figure()
[ccf1] = ccorrf(res,uv,50,1)
figure()
[acf1]=acorrf(res,50,1)

%% check partial %%

figure;
[pacf1] = pacorrf(res,40,1);

figure;
parcorr(res,40,1)

%% BJ Model %%

datai_new = datad(1:4700);
datav_new = datad_new(1:4700);
M_bj = bj(datai_new, [2 0 2 2 16])
present(M_bj)
figure()
compare(datav_new,M_bj)

sys_new = d2c(M_bj, 'zoh')
apple_new = zpk(sys_new)
figure;
pzmap(apple_new)
title('pole-zero map of Apple_new')
figure;
step(apple_new)

%% Validate the Model %%
figure;
resid(M_bj,datav);
legend('Noise 1')
res1 = resid(M_bj,datav);
r1 = res1.y;
[S1,x1] = chisq(20,r1,100),grid on

uv = datav.u;
res = get(res1,'y');
figure()
[ccf1] = ccorrf(res,uv,50,1)
figure()
[acf1]=acorrf(res,50,1)

%% polydata %%
Tdel = 0.6;
[A,B,C,D,F] = polydata(M_bj);
GD = tf(B,F,Ts);
HD = tf(C,D,Ts);
zpk(HD)
GC = d2c(GD);
[nc1,dc1] = tfdata(GC,'v');
Gmodel = tf(nc1,dc1,'OutputDelay',Tdel)
zpk(Gmodel)

%gives same result as OE