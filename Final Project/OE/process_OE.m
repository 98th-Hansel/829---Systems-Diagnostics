%%process_OE
%generate simulation data for the project:
% Process has OE structure
% syntax: [y,Ts]=process_OE(u,flag); 
% where u - discrete input
% flag - I.D. number for the process:
%        if you're assigned number 1, use flag='01', etc.
% Ts - sampling time
% y - discrete output
%
% Last Revision: October 19, 2021        M.S. Zywno               
function [y,Ts]=process_OE(u,flag);
% Process OE:
N=length(u);
% Modified to properly ensure a 0 at the
% beginning of a single digit, in case
% a student forgets to place one there
if(length(flag) == 1)
flag = strcat('0',flag);
end
if flag=='01'
a=[-2.6 -1.75 -0.15;1 0 0;0 1 0];
b=[1;0;0];c=[0 -2.4  0.24];d=0;
Tdel=3;
DC=5;NoiseA=0.01;SAT=10;Ts=0.2;
elseif flag=='02'
a=[-3 -36;1 0];
b=[1;0];c=[9 27];d=0;
Tdel=0.3;
DC=-3;NoiseA=0.01;SAT=7;Ts=0.02;
elseif flag=='03'
a=[-7.5  -37.5 -125.0;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 118.75];d=0;
Tdel=0.6;
DC=5;NoiseA=0.001;SAT=10;Ts=0.03;
elseif flag=='04'
a=[-4.2 -19.6 -48;1 0 0;0 1 0];
b=[1;0;0];c=[0 -6.1333 18.4];d=0;
Tdel=0.6;
DC=-7;NoiseA=0.001;SAT=15;Ts=0.05;
elseif flag=='05'
a=[-11 -32 -28;1 0 0;0 1 0];
b=[1;0;0];c=[0 343 68.6];d=0;
Tdel=0.3;
DC=5;NoiseA=0.1;SAT=20;Ts=0.05;
elseif flag=='06'
a=[-1.4 -16.24 -3.2;1 0 0;0 1 0];
b=[1;0;0];c=[-1.8667 0 16.8];d=0;
Tdel=0.3;
DC=-4;NoiseA=0.001;SAT=10;Ts=0.03;
elseif flag=='07'
a=[-1 -0.31 -0.03;1 0 0;0 1 0];
b=[1;0;0];c=[0  0.05 0.05];d=0;
Tdel=0.7;
DC=5;NoiseA=0.005;SAT=10;Ts=0.1;
elseif flag=='08'
a=[-3.85 -30.25;1 0];
b=[1;0];c=[200 100];d=0;
Tdel=0.6;
DC=4;NoiseA=0.2;SAT=10;Ts=0.02;
elseif flag=='09'
a=[-6.65 -38.5 -151.25;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 150];d=0;
Tdel=0.4;
DC=-2;NoiseA=0.001;SAT=10;Ts=0.05;
elseif flag=='10'
a=[-5.25 -27 -60.75;1 0 0;0 1 0];
b=[1;0;0];c=[0 -15.1875 15.1875];d=0;
Tdel=0.6;
DC=4;NoiseA=0.001;SAT=8;Ts=0.03;
elseif flag=='11'
a=[-5 -8 -4;1 0 0;0 1 0];
b=[1;0;0];c=[0 15 3];d=0;
Tdel=0.8;
DC=-3;NoiseA=0.01;SAT=10;Ts=0.05;
elseif flag=='12'
a=[-1.9 -9.18 -0.9;1 0 0;0 1 0];
b=[1;0;0];c=[-9.5 25.65 8.55];d=0;
Tdel=0.5;
DC=6;NoiseA=0.1;SAT=12;Ts=0.05;
elseif flag=='13'
a=[-11 -32 -28;1 0 0;0 1 0];
b=[1;0;0];c=[-665 0 26.6];d=0;
Tdel=0.6;
DC=-2;NoiseA=0.6;SAT=20;Ts=0.03;
elseif flag=='14'
a=[-17.5  -87.5 -125;1 0 0;0 1 0];
b=[1;0;0];c=[48.4375 193.75 193.75];d=0;
Tdel=0.4;
DC=3;NoiseA=0.01;SAT=10;Ts=0.02;
elseif flag=='15'
a=[-4.1 -2.15 -0.175;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 0.1575];d=0;
Tdel=3;
DC=-5;NoiseA=0.01;SAT=15;Ts=0.2;
elseif flag=='16'
a=[-1.5 -25;1 0];
b=[1;0];c=[20 20];d=0;
Tdel=0.6;
DC=-1;NoiseA=0.01;SAT=10;Ts=0.05;
elseif flag=='17'
a=[-1.05 -12.25;1 0];
b=[1;0];c=[-7.9625 7.9625];d=0;
Tdel=0.8;Ts=0.05;
DC=2;NoiseA=0.005;SAT=10;
elseif flag=='18'
a=[-4.8 -41.4 -108;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 81];d=0;
Tdel=0.5;Ts=0.05;
DC=-3;NoiseA=0.005;SAT=10;
elseif flag=='19'
a=[-3 -6 -8;1 0 0;0 1 0];
b=[1;0;0];c=[0 -1.7 3.4];d=0;
Tdel=0.5;Ts=0.05;
DC=-3;NoiseA=0.001;SAT=10;
elseif flag=='20'
a=[-9.7 -13.9 -2.4;1 0 0;0 1 0];
b=[1;0;0];c=[0 -1.3600 4.0800];d=0;
Tdel=1.4;Ts=0.1;
DC=-3;NoiseA=0.005;SAT=10;
elseif flag=='21'
a=[-2.4 -65.28 -51.2;1 0 0;0 1 0];
b=[1;0;0];c=[-56 442.4 44.8];d=0;
Tdel=0.4;Ts=0.04;
DC=-3;NoiseA=0.005;SAT=10;
elseif flag=='22'
a=[-25.2 -155 -30;1 0 0;0 1 0];
b=[1;0;0];c=[-87 417.6 87];d=0;
Tdel=0.5;Ts=0.01;
DC=-3;NoiseA=0.005;SAT=10;
elseif flag=='23'
a=[-1.8 -36;1 0];
b=[1;0];c=[8.1 16.2];d=0;
Tdel=0.5;Ts=0.05;
DC=-3;NoiseA=0.001;SAT=10;
elseif flag=='24'
a=[-10.1 -101 -10;1 0 0;0 1 0];
b=[1;0;0];c=[-383.3333 268.333 115];d=0;
Tdel=0.5;Ts=0.05;
DC=-3;NoiseA=0.05;SAT=10;
elseif flag=='25'
a=[-13 -32 -20;1 0 0;0 1 0];
b=[1;0;0];c=[0 370 37];d=0;
Tdel=0.5;Ts=0.05;
DC=-3;NoiseA=0.05;SAT=10;
elseif flag=='26'
a=[-2.6 -1.75 -0.15;1 0 0;0 1 0];
b=[1;0;0];c=[0 -3.9 0.39];d=0;
Tdel=2.2;
DC=5;NoiseA=0.02;SAT=10;Ts=0.1;
elseif flag=='27'
a=[-3 -36;1 0];
b=[1;0];c=[21 63];d=0;
Tdel=0.6;
DC=-3;NoiseA=0.002;SAT=7;Ts=0.05;
elseif flag=='28'
a=[-7.5  -37.5 -125.0;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 268.75];d=0;
Tdel=0.4;
DC=5;NoiseA=0.02;SAT=10;Ts=0.05;
elseif flag=='29'
a=[-4.2 -19.6 -48;1 0 0;0 1 0];
b=[1;0;0];c=[0 -12.2667 36.8];d=0;
Tdel=0.2;
DC=-7;NoiseA=0.001;SAT=15;Ts=0.05;
elseif flag=='30'
a=[-11 -32 -28;1 0 0;0 1 0];
b=[1;0;0];c=[0 249.2 49.84];d=0;
Tdel=0.3;
DC=5;NoiseA=0.05;SAT=25;Ts=0.05;
elseif flag=='31'
a=[-1.4 -16.24 -3.2;1 0 0;0 1 0];
b=[1;0;0];c=[-2.4 0 21.6];d=0;
Tdel=0.6;
DC=-4;NoiseA=0.15;SAT=10;Ts=0.05;
elseif flag=='32'
 a=[-1 -0.31 -0.03;1 0 0;0 1 0];
b=[1;0;0];c=[0 0.0531 0.0531];d=0;
Tdel=1.5;
DC=5;NoiseA=0.0015;SAT=10;Ts=0.1;   
elseif flag=='33'
a=[-3.85 -30.25;1 0];
b=[1;0];c=[80.4650 40.2325];d=0;
Tdel=0.55;
DC=4;NoiseA=0.15;SAT=20;Ts=0.05;
elseif flag=='34'
a=[-6.65 -38.5 -151.25;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 251.0750];d=0;
Tdel=0.45;
DC=-2;NoiseA=0.002;SAT=10;Ts=0.05;
elseif flag=='35'
a=[-5.25 -27 -60.75;1 0 0;0 1 0];
b=[1;0;0];c=[0 -35.4375 35.4375];d=0;
Tdel=0.6;
DC=4;NoiseA=0.001;SAT=8;Ts=0.04;
elseif flag=='36'
a=[-5 -8 -4;1 0 0;0 1 0];
b=[1;0;0];c=[0 26.4 5.28];d=0;
Tdel=0.75;
DC=-3;NoiseA=0.05;SAT=10;Ts=0.05;
elseif flag=='37'
a=[-1.9 -9.18 -0.9;1 0 0;0 1 0];
b=[1;0;0];c=[-15.4 41.58 13.86];d=0;
Tdel=0.35;
DC=6;NoiseA=0.15;SAT=20;Ts=0.05;
elseif flag=='38'
a=[-11 -32 -28;1 0 0;0 1 0];
b=[1;0;0];c=[-357 0 14.28];d=0;
Tdel=0.65;
DC=-2;NoiseA=0.15;SAT=25;Ts=0.05;
elseif flag=='39'
a=[-17.5  -87.5 -125;1 0 0;0 1 0];
b=[1;0;0];c=[62.8125 251.25 251.25];d=0;
Tdel=0.15;
DC=3;NoiseA=0.015;SAT=10;Ts=0.01;
elseif flag=='40'
a=[-4.1 -2.15 -0.175;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 0.2083];d=0;
Tdel=1.6;
DC=-5;NoiseA=0.003;SAT=15;Ts=0.2;
elseif flag=='41'
a=[-1.5 -25;1 0];
b=[1;0];c=[29.5 29.5];d=0;
Tdel=1;
DC=-1;NoiseA=0.03;SAT=10;Ts=0.05;
elseif flag=='42'
a=[-1.05 -12.25;1 0];
b=[1;0];c=[-16.2925 16.2925];d=0;
Tdel=0.45;Ts=0.05;
DC=2;NoiseA=0.01;SAT=10;
elseif flag=='43'
a=[-4.8 -41.4 -108;1 0 0;0 1 0];
b=[1;0;0];c=[0 0 189];d=0;
Tdel=0.55;Ts=0.05;
DC=-3;NoiseA=0.002;SAT=10;
elseif flag=='44'
a=[-3 -6 -8;1 0 0;0 1 0];
b=[1;0;0];c=[0 -2.68 5.36];d=0;
Tdel=0.7;Ts=0.05;
DC=-3;NoiseA=0.002;SAT=10;
elseif flag=='45'
a=[-9.7 -13.9 -2.4;1 0 0;0 1 0];
b=[1;0;0];c=[0 -0.992 2.976];d=0;
Tdel=0.9;Ts=0.1;
DC=-3;NoiseA=0.002;SAT=10;
elseif flag=='46'
a=[-2.4 -65.28 -51.2;1 0 0;0 1 0];
b=[1;0;0];c=[-66.4 524.56 53.12];d=0;
Tdel=0.3;Ts=0.03;
DC=-3;NoiseA=0.0025;SAT=10;
elseif flag=='47'
a=[-25.2 -155 -30;1 0 0;0 1 0];
b=[1;0;0];c=[-38.7 185.76 38.7];d=0;
Tdel=0.15;Ts=0.01;
DC=-3;NoiseA=0.0025;SAT=10;
elseif flag=='48'
a=[-1.8 -36;1 0];
b=[1;0];c=[ 25.74 51.48];d=0;
Tdel=0.35;Ts=0.05;
DC=-3;NoiseA=0.001;SAT=10;
elseif flag=='49'
a=[-17 -80 -100;1 0 0;0 1 0];
b=[1;0;0];c=[-40 -120 80];d=0;
Tdel=0.4;Ts=0.02;
DC=-3;NoiseA=0.01;SAT=10;
elseif flag=='50'
a=[-13 -32 -20;1 0 0;0 1 0];
b=[1;0;0];c=[0 246 24.6];d=0;
Tdel=0.45;Ts=0.05;
DC=-3;NoiseA=0.15;SAT=10;
elseif flag=='53'
a=[-3.2 -18.4 -32;1 0 0;0 1 0];
b=[1;0;0];c=[0 -3 6];d=0;
Tdel=0.9;
DC=4;NoiseA=0.01;SAT=10;Ts=0.05;
elseif flag=='54'
a=[-1.4 -16.24 -3.2;1 0 0;0 1 0];
b=[1;0;0];c=[-2 0 12.5];d=0;
Tdel=0.45;
DC=2;NoiseA=0.02;SAT=10;Ts=0.03;
elseif flag=='55'
a=[-1.3 -0.46 -0.048;1 0 0;0 1 0];
b=[1;0;0];c=[0  0.25 0.25];d=0;
Tdel=1.3;
DC=-3;NoiseA=0.005;SAT=10;Ts=0.1;
elseif flag=='56'
a=[-4.75 -25.875 -50.625;1 0 0;0 1 0];
b=[1;0;0];c=[0 -10 10];d=0;
Tdel=0.36;
DC=-2;NoiseA=0.01;SAT=8;Ts=0.03;
elseif flag=='57'
a=[-11 -32 -28;1 0 0;0 1 0];
b=[1;0;0];c=[-500 0 5];d=0;
Tdel=0.39;
DC=3;NoiseA=0.6;SAT=10;Ts=0.03;
elseif flag=='58'
a=[-4.2 -19.6 -48;1 0 0;0 1 0];
b=[1;0;0];c=[0 -12.2667 36.8];d=0;
Tdel=0.4;
DC=3;NoiseA=0.01;SAT=15;Ts=0.05;
elseif flag=='59'
a=[-2.4 -65.28 -51.2;1 0 0;0 1 0];
b=[1;0;0];c=[-66.4 524.56 53.12];d=0;
Tdel=0.3;Ts=0.03;
DC=2;NoiseA=0.0025;SAT=10;
elseif flag=='60'
a=[-1.5 -25;1 0];
b=[1;0];c=[29.5 29.5];d=0;
Tdel=0.6;
DC=7;NoiseA=0.03;SAT=10;Ts=0.05;
end
disp(' ')
disp(['Process OE # ' num2str(flag) ' is sampled at Ts = ' num2str(Ts) ' do not change it!'])
disp(' ')
disp('The input waveform you specified will now be applied')
disp('to the process and the I/O data will be displayed')
disp(' ')
disp(['You have generated N = ' num2str(N) ' samples in your DPRBS signal'])

if flag=='57'
    nk=floor(Tdel/Ts);
else
    nk=ceil(Tdel/Ts);
end
% OE Model H = 1
numh=1;denh=1;
[ad,bd,cd,dd]=c2dm(a,b,c,d,Ts,'zoh');
[numg,dend]=ss2tf(ad,bd,cd,dd,1);
deng=[dend zeros(1,nk)];
A=1;B=[zeros(1,nk) numg];F=dend;
C=1;D=1;
Mn=idpoly(A,B,C,D,F,NoiseA,Ts);
u=vector(u,'col');
yn=sim(Mn,u,'noise');
yu=yn+DC;
y=sat(SAT,yu);
y=vector(y,'col');
z=iddata(y,u,Ts);
idplot(z)
title(['Process OE # ' num2str(flag) ' is sampled with Ts = ' num2str(Ts) ])