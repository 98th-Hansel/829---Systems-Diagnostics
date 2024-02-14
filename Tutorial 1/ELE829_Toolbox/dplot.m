%DPLOT Plots up to 5 pairs of discrete data sequences, with the proper 
%      time scale.
%
%     dplot(y1,T1,y2,T2,y3,T3,y4,T4,y5,T5);
%
% Input: yi - output samples sequence, Ti - corresponding sampling period 
%
% Last revision: August 31, 2013                     M.S. Zywno
function dplot(y1,T1,y2,T2,y3,T3,y4,T4,y5,T5);

if nargin==2
timeax1=[0:length(y1)-1];
plot(timeax1*T1,y1)
xlabel('time in seconds')
elseif nargin==4
timeax1=[0:length(y1)-1];
timeax2=[0:length(y2)-1];
plot(timeax1*T1,y1,timeax2*T2,y2)
xlabel('time in seconds')
elseif nargin==6
timeax1=[0:length(y1)-1];
timeax2=[0:length(y2)-1];
timeax3=[0:length(y3)-1];
plot(timeax1*T1,y1,timeax2*T2,y2,timeax3*T3,y3)
xlabel('time in seconds')
elseif nargin==8
timeax1=[0:length(y1)-1];
timeax2=[0:length(y2)-1];
timeax3=[0:length(y3)-1];
timeax4=[0:length(y4)-1];
plot(timeax1*T1,y1,timeax2*T2,y2,timeax3*T3,y3,timeax4*T4,y4)
xlabel('time in seconds')
else
timeax1=[0:length(y1)-1];
timeax2=[0:length(y2)-1];
timeax3=[0:length(y3)-1];
timeax4=[0:length(y4)-1];
timeax5=[0:length(y5)-1];
plot(timeax1*T1,y1,timeax2*T2,y2,timeax3*T3,y3,timeax4*T4,y4,timeax5*T5,y5)
end





















