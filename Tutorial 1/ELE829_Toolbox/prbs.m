%PRBS
% generates a random switching waveform of values 1 and -1
% PRBS - Psudo Random Binary Signal
% N - number of points in time vector
% T - switch time constant in sec
% Tfin - duration of the signal in sec
%
% [t,u]=prbs(N,T,Tfin);
%
% Last revision: January 2014            Dr. M.S. Zywno		
function [t,u]=prbs(N,T,Tfin);
k=ceil(Tfin/T);
k1=sign(randn(k,1));
dt=Tfin/N;
t=0:dt:Tfin;
imax=max(size(t));
ik=1;
for i=1:imax
    if t(i) <= ik*T
    u(i)=k1(ik);
    else
    ik=ik+1;
    u(i)=k1(ik);
    end
end
[t1,u1]=stairs(t,u);
legend off;
plot(t1,u1),title(['PRBS waveform, switch time constant T = ' num2str(T)]);
xlabel('time in seconds');
axis([0 Tfin+T -1.2 1.2]);
