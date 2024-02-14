%% Load data %%
load('F:\Documents\Ryerson\Year 4\ELE829\Tutorial Projects\Tutorial 3\Data Set\tut3_data10.mat')

%% plotting the noise profiles %%
figure;
idplot(noise1),title('noise 1 Data')
figure;
idplot(noise2), title('Noise 2 Data')
figure;
idplot(noise3), title('Noise 3 Data')
figure;
idplot(noise4), title('Noise 4 Data')
figure;
idplot(noise5), title('Noise 5 Data')

%% Split Data to identification and Validation %%

noise1i = noise1(1:4000); noise1v = noise1(4001:end);
noise2i = noise2(1:4000); noise2v = noise2(4001:end);
noise3i = noise3(1:4000); noise3v = noise3(4001:end);
noise4i = noise4(1:4000); noise4v = noise4(4001:end);
noise5i = noise5(1:4000); noise5v = noise5(4001:end);

%% Noise 1 %%

v1 = noise1.y;
figure;
subplot(211), autocorr(v1,50)
legend('Noise 1')
subplot(212), parcorr(v1,50)

%% identify and validate noise filters%%

disp('-----------------------Noise 1 Model-----------------------')
p = 1;
M1 = ar(noise1i, p);
c
present(M1)

figure;
compare(M1, noise1v,1)

figure;
resid(M1,noise1v);
legend('Noise 1')
res1 = resid(M1,noise1v);
r1 = res1.y;
[S1,x1] = chisq(25,r1,0),grid on
%% Noise 2 %%

v2 = noise2.y;
figure;
subplot(211), autocorr(v2,50)
legend('Noise 2')
subplot(212), parcorr(v2,50)

%% identify and validate noise filters%%

disp('-----------------------Noise 2 Model-----------------------')
p = 2;
M2 = ar(noise2i, p);

present(M2)

figure;
compare(M2, noise2v,1)

figure;
resid(M2,noise2v);
legend('Noise 2')
res2 = resid(M2,noise2v);
r2 = res2.y;
[S2,x2] = chisq(25,r2,0),grid on

%% Noise 3 %%

v3 = noise3.y;
figure;
subplot(211), autocorr(v3,50)
legend('Noise 3')
subplot(212), parcorr(v3,50)

%% identify and validate noise filters%%

disp('-----------------------Noise 3 Model-----------------------')
r = 1;
M3 = armax(noise3i, [0 r]);

present(M3)

figure;
compare(M3, noise3v,1)

figure;
resid(M3,noise3v);
legend('Noise 3')
res3 = resid(M3,noise3v);
r3 = res3.y;
[S3,x3] = chisq(25,r3,0),grid on

%% Noise 4 %%

v4 = noise4.y;
figure;
subplot(211), autocorr(v4,50)
legend('Noise 4')
subplot(212), parcorr(v4,50)

%% identify and validate noise filters%%

disp('-----------------------Noise 4 Model-----------------------')
p = 2;
r = 1;
M4= armax(noise4i, [p r]);

present(M4)

figure;
compare(M4, noise4v,1)

figure;
resid(M4,noise4v);
legend('Noise 4')
res4 = resid(M4,noise4v);
r4 = res4.y;
[S4,x4] = chisq(25,r4,0),grid on

%% Noise 5 %%

v5 = noise5.y;
figure;
subplot(211), autocorr(v5,50)
legend('Noise 5')
subplot(212), parcorr(v5,50)

%% identify and validate noise filters%%

disp('-----------------------Noise 5 Model-----------------------')
p = 2;
r = 1;
M5= armax(noise5i, [p r]);

present(M5)

figure;
compare(M5, noise5v,1)

figure;
resid(M5,noise5v);
legend('Noise 5')
res5 = resid(M5,noise5v);
r5 = res5.y;
[S5,x5] = chisq(25,r5,0),grid on
