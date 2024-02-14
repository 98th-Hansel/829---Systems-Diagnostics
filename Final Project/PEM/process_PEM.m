%%process_PEM
%generate simulation data for the project:
% Process has general PEM structure
% syntax: [y,Ts]=process_PEM(u,flag); 
% where u - discrete input
% flag - I.D. number for the process:
%        if you're assigned number 1, use flag='01', etc.
% Ts - sampling time
% y - discrete output
%
% Last Revision: October 19, 2021        M.S. Zywno               
function [y,Ts]=process_PEM(u,flag);
% Process PEM:
N=length(u);
if flag=='01'
a=[-22 -155 -350;1 0 0;0 1 0];
b=[1;0;0];c=[0 -4000 400];d=0;
Tdel=0.4;
Ts=0.02;
DC=2;NoiseA=0.0001;SAT=150;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
C=[1 0 0 0];D=dend;
elseif flag=='02'
a=[-9 -26.25 -25;1 0 0;0 1 0];
b=[1;0;0];c=[0 -50 125];d=0;
Tdel=0.5;
Ts=0.05;
DC=-2;NoiseA=0.02;SAT=10;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 0];D=[1 -h(3)];
elseif flag=='03'
a=[-9 -26 -24;1 0 0;0 1 0];
b=[1;0;0];c=[0 -10 20];d=0;
Tdel=0.3;
DC=3;NoiseA=0.005;SAT=10;Ts=0.02;
C=[1 -0.5];D=[1 0];
elseif flag=='04'
a=[-10 -33 -36;1 0 0;0 1 0];
b=[1;0;0];c=[0 10 20];d=0;
Tdel=0.2;
Ts=0.01;
DC=5;NoiseA=0.0001;SAT=10;
C=conv([1 -0.5],[1 -0.7]);D=1;
elseif flag=='05'
a=[-9 -26 -24;1 0 0;0 1 0];
b=[1;0;0];c=[0 10 10];d=0;
Tdel=0.6;
DC=5;NoiseA=0.003;SAT=12;
Ts=0.03;
C=[1  0];D=[1 -0.63];
elseif flag=='06'
a=[-4 -5 -2;1 0 0;0 1 0];
b=[1;0;0];c=[0 -10 10];d=0;
Tdel=0.3;
DC=4;NoiseA=0.1;SAT=15;
Ts=0.05;
C=conv([1 -0.6],[1 +0.7]);D=[1 0 0];
elseif flag=='07'
a=[-4 -4.25 -1.25;1 0 0;0 1 0];
b=[1;0;0];c=[0 2 4];d=0;
Tdel=0.45;
DC=5;NoiseA=0.0005;SAT=10;
Ts=0.05;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 -0.7];D=conv([1 -h(1)],[1 -h(2)]);
elseif flag=='08'
a=[-3 -2.25 -0.5;1 0 0;0 1 0];
b=[1;0;0];c=[0 2 2];d=0;
Tdel=0.35;
DC=4;NoiseA=0.01;SAT=10;Ts=0.05;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 0 0];D=conv([1 -0.5],[1 -h(3)]);
elseif flag=='09'
a=[-3.5 -3.5 -1;1 0 0;0 1 0];
b=[1;0;0];c=[0 -2 2];d=0;
Tdel=0.3;
DC=-2;NoiseA=0.005;SAT=15;
Ts=0.03;
C=[1 0];D=[1 +0.8];
elseif flag=='10'
a=[-2.5 -2 -0.5;1 0 0;0 1 0];
b=[1;0;0];c=[0 -4 4];d=0;
Tdel=0.2;
DC=4;NoiseA=0.07;SAT=10;Ts=0.05;
C=[1 0 0];D=conv([1 -0.7],[1 -0.5]);
elseif flag=='11'
a=[-10 -33 -36;1 0 0;0 1 0];
b=[1;0;0];c=[0 -10 30];d=0;
Tdel=0.3;
DC=-3;NoiseA=0.005;SAT=10;
Ts=0.02;
C=[1 0];D=[1 +0.5];
elseif flag=='12'
a=[-9  -26.25 -25;1 0 0;0 1 0];
b=[1;0;0];c=[0 -50 25];d=0;
Tdel=0.3;
DC=6;NoiseA=0.01;SAT=15;
Ts=0.03;
C=[1 -0.4];D=[1 0];
elseif flag=='13'
a=[-3 -12  -10;1 0 0;0 1 0];
b=[1;0;0];c=[0 -8 24];d=0;
Tdel=0.4;
DC=5;NoiseA=0.0008;SAT=10;
Ts=0.02;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 0 0 0];D=conv(conv([1 -0.96],[1 -0.5]),[1 -0.7]);
elseif flag=='14'
a=[-3 -12 -10;1 0 0;0 1 0];
b=[1;0;0];c=[0 -8 24];d=0;
Tdel=0.3;
DC=3;NoiseA=0.05;SAT=10;
Ts=0.02;
C=[1 0 0];D=conv([1 +0.7],[1 -0.7]);
elseif flag=='15'
a=[-4.1 -2.15 -0.175;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 0.63];d=0;
Tdel=0.8;
Tdel=2.4;
DC=-5;NoiseA=0.005;SAT=15;
Ts=0.2;
C=[1 0 0 0];D=conv(conv([1 -0.8],[1 -0.4]),[1 -0.65]);
elseif flag=='16'
a=[-1.5 -25;1 0];
b=[1;0];c=[7 7];d=0;
Tdel=0.3;
DC=-1;NoiseA=0.000005;SAT=10;
Ts=0.02;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
C=[1 -0.2];D=dend;
elseif flag=='17'
a=[-1.05 -12.25;1 0];
b=[1;0];c=[-7.9625 7.9625];d=0;
Tdel=0.3;
Ts=0.03;
DC=-2;NoiseA=0.01;SAT=10;
C=[1 0 0];D=conv([1 +0.35],[1 -0.8]);
elseif flag=='18'
a=[-4.8 -41.4 -108;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 81];d=0;
Tdel=0.5;Ts=0.02;
DC=-3;NoiseA=0.0005;SAT=10;
C=conv([1 -0.8],[1 -0.4]);D=1;
elseif flag=='19'
a=[-3 -6 -8;1 0 0;0 1 0];
b=[1;0;0];c=[0 -1.7 3.4];d=0;
Tdel=0.6;Ts=0.03;
DC=-3;NoiseA=0.0003;SAT=10;
C=[1 0];D=[1 +0.9];
elseif flag=='20'
a=[-9.7 -13.9 -2.4;1 0 0;0 1 0];
b=[1;0;0];c=[0 -0.56 1.68];d=0;
Tdel=0.5;Ts=0.05;
DC=-3;NoiseA=0.00005;SAT=10;
C=[1 -0.9];D=[1 0];
elseif flag=='21'
a=[-2.4 -65.28 -51.2;1 0 0;0 1 0];
b=[1;0;0];c=[-56 442.4 44.8];d=0;
Tdel=0.24;Ts=0.02;
DC=-3;NoiseA=0.05;SAT=20;
C=conv([1 -0.35],[1 -0.75]);D=[1 0 0];
elseif flag=='22'
a=[-25.2 -155 -30;1 0 0;0 1 0];
b=[1;0;0];c=[-87 417.6 87];d=0;
Tdel=0.25;Ts=0.01;
DC=-5;NoiseA=0.05;SAT=12;
C=[1 0 0];D=conv([1 -0.6],[1 +0.7]);
elseif flag=='23'
a=[-1.8 -36;1 0];
b=[1;0];c=[8.1 16.2];d=0;
Tdel=0.45;Ts=0.03;
DC=6;NoiseA=0.00001;SAT=15;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
C=[1 0 0];D=dend;
elseif flag=='24'
a=[-12 -45 -50;1 0 0;0 1 0];
b=[1;0;0];c=[-20 20 40];d=0;
Tdel=0.4;
Ts=0.02;
DC=-3;NoiseA=0.005;SAT=20;
C=[1 0 0];D=conv([1 -0.3],[1 -0.6]);
elseif flag=='25'
a=[-13 -32 -20;1 0 0;0 1 0];
b=[1;0;0];c=[0 170 17];d=0;
Tdel=0.5;Ts=0.05;
DC=-3;NoiseA=0.005;SAT=10;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 0 0];D=conv([1 -h(2)],[1 -h(3)]);
elseif flag=='26'
a=[-2.6 -1.75 -0.15;1 0 0;0 1 0];
b=[1;0;0];c=[0 -0.9 0.09];d=0;
Tdel=2.6;
DC=5;NoiseA=0.001;SAT=10;
Ts=0.2;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 0];D=[1 -h(1)];
elseif flag=='27'
a=[-3 -36;1 0];
b=[1;0];c=[9 27];d=0;
Tdel=0.2;
DC=-3;NoiseA=0.02;SAT=7;Ts=0.01;
C=[1 -0.2];D=[1 0];
elseif flag=='28'
a=[-7.5  -37.5 -125.0;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 118.75];d=0;
Tdel=0.4;
DC=5;NoiseA=0.0002;SAT=10;
Ts=0.04;
C=[1 0 0];D=conv([1 -0.55],[1 -0.85]);
elseif flag=='29'
a=[-4.2 -19.6 -48;1 0 0;0 1 0];
b=[1;0;0];c=[0 -3.4667 10.4];d=0;
Tdel=0.6;
DC=-7;NoiseA=0.0001;SAT=15;Ts=0.04;
C=conv([1 0.3],[1 -0.8]);D=[1 0 0];
elseif flag=='30'
a=[-11 -32 -28;1 0 0;0 1 0];
b=[1;0;0];c=[0 63 12.6];d=0;
Tdel=0.3;
DC=5;NoiseA=0.005;SAT=12;Ts=0.05;
C=[1 -0.2];D=[1 0];
elseif flag=='31'
a=[-1.4 -16.24 -3.2;1 0 0;0 1 0];
b=[1;0;0];c=[-1.1556 0 10.4];d=0;
Tdel=0.9;
DC=-4;NoiseA=0.005;SAT=10;Ts=0.1;
C=[1 -0.1];D=conv([1 -0.3],[1 -0.4]);
elseif flag=='32'
a=[-1 -0.31 -0.03;1 0 0;0 1 0];
b=[1;0;0];c=[0 0.0285 0.0285];d=0;
Tdel=1.4;
DC=5;NoiseA=0.00015;SAT=10;Ts=0.1;
C=[1 0 0 0];D=conv([1 -0.5],conv([1 -0.95],[1 -0.15]));
elseif flag=='33'
a=[-3.85 -30.25;1 0];
b=[1;0];c=[51.4250 25.7125];d=0;
Tdel=0.4;
DC=4;NoiseA=0.01;SAT=10;
Ts=0.02;
C=conv([1 0.45],[1 -0.9]);D=[1 0 0];
elseif flag=='34'
a=[-6.65 -38.5 -151.25;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 52.9375];d=0;
Tdel=0.6;
DC=-2;NoiseA=0.0002;SAT=10;
Ts=0.04;
C=[1 0];D=[1 -0.65];
elseif flag=='35'
a=[-5.25 -27 -60.75;1 0 0;0 1 0];
b=[1;0;0];c=[0 -15.1875 15.1875];d=0;
Tdel=0.8;
DC=4;NoiseA=0.0001;SAT=8;Ts=0.04;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 0 0];D=conv([1 -h(3)],[1 -0.5]);
elseif flag=='36'
a=[-5 -8 -4;1 0 0;0 1 0];
b=[1;0;0];c=[0 15 3];d=0;
Tdel=0.8;
DC=-3;NoiseA=0.005;SAT=10;
Ts=0.04;
C=[1 -0.5];D=[1 0];
elseif flag=='37'
a=[-1.9 -9.18 -0.9;1 0 0;0 1 0];
b=[1;0;0];c=[-9.5 25.65 8.55];d=0;
Tdel=3;
DC=6;NoiseA=0.015;SAT=12;
Ts=0.2;
C=conv([1 -0.55],[1 -0.35]);D=[1 0];
elseif flag=='38'
a=[-11 -32 -28;1 0 0;0 1 0];
b=[1;0;0];c=[-665 0 26.6];d=0;
Tdel=0.7;
DC=-2;NoiseA=0.2;SAT=50;Ts=0.02;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 0];D=[1 -h(3)];
elseif flag=='39'
a=[-17.5  -87.5 -125;1 0 0;0 1 0];
b=[1;0;0];c=[29.6875 118.75 118.75];d=0;
Tdel=0.4;
DC=3;NoiseA=0.0015;SAT=10;Ts=0.02;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 0.5];D=conv([1 -h(1)],[1 +0.8]);
elseif flag=='40'
a=[-4.1 -2.15 -0.175;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 0.1575];d=0;
Tdel=3.6;
DC=-5;NoiseA=0.003;SAT=15;Ts=0.2;
C=[1 0];D=[1 0.45];
elseif flag=='41'
a=[-1.5 -25;1 0];
b=[1;0];c=[20 20];d=0;
Tdel=1;
DC=-1;NoiseA=0.003;SAT=10;Ts=0.05;
C=[1 0 0 0];D=conv([1 -0.5],conv([1 -0.3],[1 -0.7]));
elseif flag=='42'
a=[-1.05 -12.25;1 0];
b=[1;0];c=[-7.9625 7.9625];d=0;
Tdel=0.6;Ts=0.04;
DC=2;NoiseA=0.001;SAT=10;
C=[1 0 0];D=conv([1 0.3],[1 -0.4]);
elseif flag=='43'
a=[-4.8 -41.4 -108;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 81];d=0;
Tdel=0.6;Ts=0.03;
DC=-3;NoiseA=0.001;SAT=10;
C=[1 -0.75];D=[1 0];
elseif flag=='44'
a=[-3 -6 -8;1 0 0;0 1 0];
b=[1;0;0];c=[0 -1.7 3.4];d=0;
Tdel=0.7;Ts=0.05;
DC=-3;NoiseA=0.0005;SAT=10;
C=[1 -0.4];D=conv([1 -0.8],[1 -0.7]);
elseif flag=='45'
a=[-9.7 -13.9 -2.4;1 0 0;0 1 0];
b=[1;0;0];c=[0 -0.56 1.68];d=0;
Tdel=0.8;Ts=0.1;
DC=-3;NoiseA=0.00002;SAT=10;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 0 0];D=conv([1 -h(1)],[1 -h(3)]);
elseif flag=='46'
a=[-2.4 -65.28 -51.2;1 0 0;0 1 0];
b=[1;0;0];c=[-56 442.4 44.8];d=0;
Tdel=0.3;Ts=0.03;
DC=-3;NoiseA=0.025;SAT=10;
C=conv([1 -0.45],[1 -0.6]);D=[1 0 0];
elseif flag=='47'
a=[-25.2 -155 -30;1 0 0;0 1 0];
b=[1;0;0];c=[-27 129.6  27];d=0;
Tdel=0.24;Ts=0.01;
DC=-3;NoiseA=0.001;SAT=10;
C=[1 -0.55];D=[1 0];
elseif flag=='48'
a=[-1.8 -36;1 0];
b=[1;0];c=[8.1 16.2];d=0;
Tdel=0.35;Ts=0.05;
DC=-3;NoiseA=0.0015;SAT=10;
C=[1 0.4];D=conv([1 0.8],[1 -0.7]);
elseif flag=='49'
a=[-17 -80 -100;1 0 0;0 1 0];
b=[1;0;0];c=[-40 -120 80];d=0;
Tdel=0.4;Ts=0.02;
DC=-3;NoiseA=0.001;SAT=10;
C=[1 0 0 0];D=conv(conv([1 -0.35],[1 -0.75]),[1 -0.7]);
elseif flag=='50'
a=[-13 -32 -20;1 0 0;0 1 0];
b=[1;0;0];c=[0 170 17];d=0;
Tdel=0.45;Ts=0.05;
DC=-3;NoiseA=0.015;SAT=10;
C=[1 -0.35];D=[1 0];
elseif flag=='53'
a=[-17.5  -87.5 -125;1 0 0;0 1 0];
b=[1;0;0];c=[29.6875 118.75 118.75];d=0;
Tdel=0.6;
DC=-4;NoiseA=0.0015;SAT=10;Ts=0.02;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
h=roots(dend);
C=[1 0.5];D=conv([1 -h(3)],[1 +0.7]);
elseif flag=='54'
a=[-1.8 -36;1 0];
b=[1;0];c=[8.1 16.2];d=0;
Tdel=0.55;Ts=0.05;
DC=4;NoiseA=0.0015;SAT=10;
C=[1 0.4];D=conv([1 0.8],[1 -0.7]);
elseif flag=='55'
a=[-4.1 -2.15 -0.175;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 0.63];d=0;
Tdel=2.8;
DC=2;NoiseA=0.005;SAT=15;
Ts=0.2;
C=[1 0 0 0];D=conv(conv([1 -0.8],[1 -0.4]),[1 -0.65]);
elseif flag=='56'
a=[-2.4 -65.28 -51.2;1 0 0;0 1 0];
b=[1;0;0];c=[-56 442.4 44.8];d=0;
Tdel=0.48;Ts=0.02;
DC=2;NoiseA=0.05;SAT=20;
C=conv([1 -0.35],[1 -0.75]);D=[1 0 0];
elseif flag=='57'
a=[-10 -33 -36;1 0 0;0 1 0];
b=[1;0;0];c=[0 -40 120];d=0;
Tdel=0.32;
Ts=0.02;
DC=2;NoiseA=0.000001;SAT=15;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
C=[1 0 0 0];D=dend;
elseif flag=='58'
a=[-1.5 -25;1 0];
b=[1;0];c=[7 7];d=0;
Tdel=0.44;
DC=-1;NoiseA=0.00005;SAT=10;
Ts=0.02;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
C=[1 -0.2];D=dend;
elseif flag=='59'
a=[-1.8 -36;1 0];
b=[1;0];c=[8.1 16.2];d=0;
Tdel=0.33;Ts=0.03;
DC=6;
NoiseA=0.001;
SAT=15;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
C=[1 0 0];D=dend;
elseif flag=='60'
a=[-10 -33 -36;1 0 0;0 1 0];
b=[1;0;0];c=[0 -40 120];d=0;
Tdel=0.28;
Ts=0.02;
DC=2;NoiseA=0.000001;SAT=35;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
C=[1 0 0 0];D=dend;
end
disp(' ')
disp(['Process PEM # ' num2str(flag) ' is sampled at Ts = ' num2str(Ts) ' do not change it!'])
disp(' ')
disp('The input waveform you specified will now be applied')
disp('to the process and the I/O data will be displayed')
disp(' ')
disp(['You have generated N = ' num2str(N) ' samples in your DPRBS signal'])
if flag=='59'
    nk=floor(Tdel/Ts);
elseif flag=='23'
     nk=floor(Tdel/Ts);
elseif flag=='60'
     nk=floor(Tdel/Ts);
else
    nk=ceil(Tdel/Ts);
end

[numc,denc]=ss2tf(a,b,c,d,1);
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
deng=[dend zeros(1,nk)];
A=1;B=[zeros(1,nk) numg];F=dend;
Mn=idpoly(A,B,C,D,F,NoiseA,Ts);
u=vector(u,'col');
yn=sim(Mn,u,'noise');
yu=yn+DC;
y=sat(SAT,yu);
y=vector(y,'col');
z=iddata(y,u,Ts);
idplot(z)
title(['Process PEM # ' num2str(flag) ' is sampled with Ts = ' num2str(Ts) ])