%Tutorial 1
%Generate simulation data for Tutorial 1:
% syntax: [y,Ts]=tutorial1(u,flag,Nflag); 
% Input:
% flag - I.D. number for the process:
%        if you're assigned number 2, use flag='02', etc.
% noise OFF (Nflag = '0') or ON (Nflag = '1')
% u - discrete input - generate using "dprbs" (ELE829 Toolbox) or "idinput":
% u = dprbs(N,K); N - samples; K - switch rate
%    larger K - lower switch rate; smaller K - higher switch rate;
% OR: 
%    u = idinput(N,'prbs',BAND); N - samples; BAND=[0 p] 0< p < 1
%    smaller p - higher switch rate; larger p - lower switch rate;
% Output:
%
% Ts - sampling time
% y - discrete output
%
% Last Revision: August 30, 2021      M.S. Zywno               
function [y,Ts]=tutorial1(u,flag,Nflag);
% Tutorial 1
% Processes have OE structure and no Transportational Delay i.e. nk = 1
% All systems with a conjugate pair of poles only
% No DC Offset, but all have saturation limit SAT

if(length(flag) == 1)
flag = strcat('0',flag);
end
N=length(u);

if flag=='01'
    Kdc=0.9;z=0.15;wn=5; %Data Set # 01; Do not assign to students!
elseif flag=='02'
    Kdc=0.85;z=0.1;wn=7.5; %Data Set # 02; 
elseif flag=='03'
    Kdc=0.8;z=0.15;wn=3.5; %Data Set # 03;
elseif flag=='04'
    Kdc=0.8;z=0.35;wn=7; %Data Set # 04;
elseif flag=='05'
    Kdc=0.65;z=0.1;wn=6.5; %Data Set # 05;
elseif flag=='06'
    Kdc=0.9;z=0.15;wn=4.0; %Data Set # 06;
elseif flag=='07'
    Kdc=0.75;z=0.25;wn=5.0; %Data Set # 07;
elseif flag=='08'
    Kdc=0.5;z=0.4;wn=5.5; %Data Set # 08;
elseif flag=='09'
    Kdc=0.35;z=0.15;wn=8.5; %Data Set # 09;
elseif flag=='10'
    Kdc=0.85;z=0.35;wn=2.5; %Data Set # 10;
elseif flag=='11'
    Kdc=0.8;z=0.15;wn=4.5; %Data Set # 11;
elseif flag=='12'
    Kdc=0.85;z=0.25;wn=1.0; %Data Set # 12;
elseif flag=='13'
    Kdc=0.6;z=0.5;wn=7.0; %Data Set # 13;
elseif flag=='14'
Kdc=0.7;z=0.15;wn=2.5; %Data Set # 14;
elseif flag=='15'
Kdc=0.9;z=0.2;wn=3.5; %Data Set # 15;
elseif flag=='16'
Kdc=0.85;z=0.3;wn=7.5; %Data Set # 16;
elseif flag=='17'
Kdc=0.65;z=0.2;wn=2; %Data Set # 17;
elseif flag=='18'
Kdc=0.5;z=0.35;wn=3; %Data Set # 18;
elseif flag=='19'
Kdc=0.5;z=0.1;wn=4.5; %Data Set # 19;
elseif flag=='20'
Kdc=0.45;z=0.2;wn=3; %Data Set # 20;
elseif flag=='21'
Kdc=0.4;z=0.4;wn=3; %Data Set # 21;
elseif flag=='22'
Kdc=0.4;z=0.2;wn=6; %Data Set # 22;
elseif flag=='23'
Kdc=0.9;z=0.15;wn=7.5; %Data Set # 23;
elseif flag=='24'
Kdc=0.75;z=0.2;wn=6; %Data Set # 24;
elseif flag=='25'
Kdc=0.9;z=0.25;wn=4; %Data Set # 25;
elseif flag=='26'
Kdc=0.9;z=0.25;wn=5; %Data Set # 26;
elseif flag=='27'
Kdc=0.4;z=0.1;wn=6; %Data Set # 27;
elseif flag=='28'
Kdc=0.75;z=0.15;wn=5; %Data Set # 28;
elseif flag=='29'
Kdc=0.5;z=0.15;wn=5; %Data Set # 29;
elseif flag=='30'
Kdc=0.8;z=0.1;wn=5; %Data Set # 30;
elseif flag=='31'
Kdc=0.8;z=0.15;wn=4; %Data Set # 31;
elseif flag=='32'
Kdc=0.8;z=0.4;wn=3; %Data Set # 32;
elseif flag=='33'
Kdc=0.4;z=0.3;wn=5; %Data Set # 33;
elseif flag=='34'
Kdc=0.4;z=0.25;wn=4; %Data Set # 34;
elseif flag=='35'
Kdc=0.75;z=0.25;wn=4; %Data Set # 35;
elseif flag=='36'
Kdc=0.75;z=0.3;wn=3; %Data Set # 36;
elseif flag=='37'
Kdc=0.5;z=0.25;wn=4; %Data Set # 37;
elseif flag=='38'
Kdc=0.8;z=0.15;wn=3; %Data Set # 38;
elseif flag=='39'
Kdc=0.8;z=0.15;wn=6; %Data Set # 39;
elseif flag=='40'
Kdc=0.9;z=0.15;wn=4; %Data Set # 40;
elseif flag=='41'
Kdc=0.9;z=0.15;wn=3; %Data Set # 41;
elseif flag=='42'
Kdc=0.4;z=0.2;wn=5; %Data Set # 42;
elseif flag=='43'
Kdc=0.4;z=0.2;wn=4; %Data Set # 43;
elseif flag=='44'
Kdc=0.4;z=0.2;wn=3; %Data Set # 44;
elseif flag=='45'
Kdc=0.75;z=0.4;wn=5; %Data Set # 45;
elseif flag=='46'
Kdc=0.75;z=0.4;wn=4; %Data Set # 46;
elseif flag=='47' 
Kdc=0.75;z=0.1;wn=3; %Data Set # 47;
elseif flag=='48' 
Kdc=0.5;z=0.1;wn=6; %Data Set # 48;
elseif flag=='49'
Kdc=0.9;z=0.25;wn=3; %Data Set # 49;
elseif flag=='50' 
Kdc=0.5;z=0.1;wn=4; %Data Set # 50;
elseif flag=='51' 
Kdc=0.5;z=0.1;wn=5; %Data Set # 51;
elseif flag=='52' 
Kdc=0.5;z=0.1;wn=3; %Data Set # 52;
elseif flag=='53'
Kdc=0.8;z=0.25;wn=6; %Data Set # 53;
elseif flag=='54' 
Kdc=0.8;z=0.25;wn=5; %Data Set # 54;
elseif flag=='55' 
Kdc=0.9;z=0.15;wn=6; %Data Set # 55;
elseif flag=='56' 
Kdc=0.65;z=0.2;wn=5; %Data Set # 56;
elseif flag=='57' 
Kdc=0.65;z=0.1;wn=6; %Data Set # 57;
elseif flag=='58' 
Kdc=0.65;z=0.3;wn=4; %Data Set # 58;
elseif flag=='59' 
Kdc=0.6;z=0.25;wn=3; %Data Set # 59;
elseif flag=='60' 
Kdc=0.6;z=0.4;wn=5; %Data Set # 60;
elseif flag=='61'
Kdc=0.7;z=0.15;wn=5; %Data Set # 61;
elseif flag=='62'
Kdc=0.75;z=0.1;wn=4; %Data Set # 62;
elseif flag=='63'
Kdc=0.75;z=0.4;wn=7; %Data Set # 63;
elseif flag=='64'
Kdc=0.75;z=0.2;wn=5; %Data Set # 64;
elseif flag=='65'
Kdc=0.75;z=0.35;wn=6.5; %Data Set # 65;
end

Tdel=0; % No Transportational Delay Tdel=0 
%Generate CT system - all systems are 2nd order, underdamped
sysc1=tf(Kdc*wn^2,[1 2*z*wn wn^2]);
[numc,denc]=tfdata(sysc1,'v');
sysc=tf(numc,denc,'InputDelay',Tdel);
DC=0; % DC Offset - no DC offset for Tutorial 1
NoiseA=0.5; SAT=50; % Noise level and Saturation Limit
if Nflag=='0'
    NoiseA=0;
end
%Generate DT system using ZOH - all systems are 2nd order, underdamped
Ts=0.05; % Sampling Time
nk=ceil(Tdel/Ts); % No Transportational delay, but 1 ZOH will be added:
sysd=c2d(sysc,Ts,'zoh');
[numd,dend]=tfdata(sysd,'v');
% OE Model H(q) = 1
C=1;D=1;
%Use IDPOLY to generate output
dend1=[dend zeros(1,nk)]; % Here nk = 0 since Tdel=0
A=1;B=[zeros(1,nk) numd];F=dend1; % Here nk = 0 since Tdel=0
% 1 ZOH automatically added by "zoh' transformation
Mn=idpoly(A,B,C,D,F,NoiseA,Ts);
%Generate data for DT system without and with Noise
u=vector(u,'col');
yn=sim(Mn,u,'noise');
yu=yn+DC;
y=sat(SAT,yu);
y=vector(y,'col');
disp(' ')
disp(['Tutorial 1 Process # ' num2str(flag) ' Ts = ' num2str(Ts) ' - Do not change the sampling time!'])
disp(['Noise Level (Nflag) OFF = 0 or ON = 1:  Nflag = ' num2str(Nflag)])
disp(' ')
disp('The input waveform you specified will now be applied')
disp('to the process and the I/O data will be displayed')
disp(['You have generated N = ' num2str(N) ' samples in your DPRBS signal'])
% Artificial access to y ("clean" data) - to test effect of noise
% on diagnostic tools in frequency domain: ETFE and SPA
% if Nflag = 0 "clean" data, if Nflag = 1 "noisy" data
idplot(iddata(y,u,Ts));
title(['Tutorial 1: Process # ' num2str(flag) '  Ts = ' num2str(Ts) '  Noise =  ' num2str(Nflag)])

    