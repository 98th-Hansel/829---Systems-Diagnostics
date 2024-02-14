%% Collect I/O Data%%

flag = '04';

N = 5000;
K = 100;
A = 8;
u = A*dprbs(N,K);

[y1,Ts] = process_OE(u,flag);

DC = -7;
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
M = 500;
g1= etfe(z,M,N,Ts);
figure;
bode(g1)
hold on

z = [y u];
N = 5000;
M = 500;
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
nk = 13;
hanktest(w3,nk,0);
legend('noise-free data (CRA)')
subplot(122)
hanktest(w3,nk,1);

%% create new data set %%

flag = '4';

figure(1);
[y1_new,Ts] = process_OE(u,flag);

DC = -7;
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
M_oe = oe(datai, [3 3 13])
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

%% model %%
[A,B,C,D,F] = polydata(M_oe)
GD = tf(B,F,Ts);
GC = d2c(GD);
[nc1,dc1]=tfdata(GC,'v');
Gmodel=tf(nc1,dc1,'OutputDelay',0.6);
zpk(Gmodel)
%% new model %%
dc_val = dcgain(Gmodel);
z1 = 3.003;p1=-3.008;z=0.15;wn=4;
Gsim=tf(dc_val*(-p1)*wn^2*[1 -z1]/(-z1), conv([1 -p1],[1 2*z*wn wn^2]), 'InputDelay',0.6)
zpk(Gsim)

%% compare new model to old %%
figure;
compare(datav,M_oe,Gsim)

figure;
step(apple)
hold on
step(Gsim)
legend;