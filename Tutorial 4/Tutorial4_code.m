%% Load Data Set %%

load('F:\Documents\Ryerson\Year 4\ELE829\Tutorial Projects\Tutorial 4\Tutorial4dataset\tut4dataset10.mat')

%% collect I/O Data for OE Model Identification %%

load Tut4.mat
load Tut4c.mat

t = out(1,:)';
r = out(2,:)';
y = out(3,:)';
u = cont(2,:)';

figure;
subplot(311),plot(t,y)
title('output'), ylim([-60,60]),grid on
xlabel('Time (sec)'), ylabel('Degrees')

subplot(312),plot(t,r)
title('reference input'), ylim([-60,60]),grid on
xlabel('Time (sec)'), ylabel('Volts')

subplot(313),plot(t,u)
title('control signal'), ylim([-2,2]), grid on
xlabel('Time (sec)'), ylabel('Volts')

ri = r(1:1000); yi = y(1:1000);
rv = r(1001:end); yv = y(1001:end);

%% Part 1 Third order Model %%

Ts = 1/150;
datai = iddata(yi,ri,Ts);
nb = 3;
nf = 3;
nk = 1;
M_OE = oe(datai,[nb nf nk]);

present(M_OE)

datav = iddata(yv,rv,Ts);
figure;
compare(datav,M_OE,1);

figure;
resid(M_OE, datai);
residues = resid(M_OE, datai);
res = get(residues,'y');

m = 25;
[S,X] = chisq(m,res,0)
[S,X] = chisq(m,res,ri,0)

Mc = d2c(M_OE, 'zoh')

figure;
pzmap(Mc)
title('pole-zero map of G(s) - Third order model')

%% Second Order Model %%
disp ('**************************** SECOND ORDER ******************')
Ts = 1/150;
datai = iddata(yi,ri,Ts);
nb = 2;
nf = 2;
nk = 1;
M_OE = oe(datai,[nb nf nk]);

present(M_OE)

datav = iddata(yv,rv,Ts);
figure;
compare(datav,M_OE,1);

figure;
resid(M_OE, datai);
residues = resid(M_OE, datai);
res = get(residues,'y');

m = 25;
[S,X] = chisq(m,res,0)
[S,X] = chisq(m,res,ri,0)

Mc = d2c(M_OE, 'zoh')

figure;
pzmap(Mc)
title('pole-zero map of G(s) - Second order model')

%% Part 2 %%
% Collect IO for fast switching set %

load Tut4.mat
load Tut4c.mat

t = out(1,:)';
r = out(2,:)';
y = out(3,:)';
u = cont(2,:)';

figure;
subplot(311),plot(t,y)
title('output'), ylim([-60,60]),grid on
xlabel('Time (sec)'), ylabel('Degrees')

subplot(312),plot(t,r)
title('reference input'), ylim([-60,60]),grid on
xlabel('Time (sec)'), ylabel('Volts')

subplot(313),plot(t,u)
title('control signal'), ylim([-2,2]), grid on
xlabel('Time (sec)'), ylabel('Volts')

%% Bode Polot %%
z = [y, u];
N = max(size(y));
M = 500;
Ts = 1/150;
w = linspace(pi/(N/Ts),pi/Ts,N);
maxsize = [];
g = spa(z,M,w,maxsize,Ts);
figure;
bode(g); grid on

%% new data set %%
%% Time domain diagnostic %%

z = [y u];
L = 100;
figure;
w = cra(z, 2*L);
u3 = ones(size(w));
figure;
ys3 = decresp(w,u3);
L = 200;
xlim([0 L])
xlim([0 L])
figure;
subplot(121); Sdet = hanktest(w,nk,1);
subplot(122); Sdet = hanktest(w,nk,0);

%% Part 3 %%
% Set Servo Parameters %

La = 5 * 10^(-5);
Ra = 4;
Jm = 2.5 * 10^(-7);
Bm = 1.019 * 10^(-7);

Kp = 0.75;

Ka = 2.25;
Kt = 6.094*10^(-3);
Ke = 6.094*10^(-3);
JL = 2*10^(-5);
BL = 0;
n = 17.2;
Jeq = Jm + JL/n^2;
Beq = Bm + BL/n^2;

%% 3rd order closed loop transfer fucntion %%
num1 = [Kt*Kp*Ka];
den1 = [La*Jeq*n (Ra*Jeq+La*Beq)*n (Ra*Beq+Kt*Ke)*n Kt*Kp*Ka];
TF_3rd = tf(num1,den1)
ZPK_3rd = zpk(TF_3rd)
figure;
pzmap(TF_3rd)
title('pole-zero map of G(s) Third order theoretical model')

%% 2nd order closed loop transfer function %%
Km = Kt/(Ra*Beq+Kt*Ke);
Tm = Ra*Jeq/(Ra*Beq+Kt*Ke);
num2 = [Kp*Ka*Km];
den2 = [Tm*n n Kp*Ka*Km]
TF_2nd = tf(num2,den2)
ZPK_2nd = zpk(TF_2nd)
figure;
pzmap(TF_2nd)
title('pole-zero map of G(s) Second order theoretical model')
