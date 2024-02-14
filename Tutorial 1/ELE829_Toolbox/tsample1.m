%TSAMPLE1
% This subroutine will sample an arbitrary time response (t,y)
% at specific points of time contained in a vector ts 
% thus creating a shorter pair of signals, (ts,ys):
%
%       ys=tsample1(ts,t,y);
% see also: TSAMPLER, FSAMPLER, FSAMPLE1, LINES
%                                                 
% Last revision: August 31, 2013                     M.S. Zywno
function ys=tsample1(ts,t,y);
clc
disp('Current number of requested samples is:')
x1=max(size(ts));
x2=max(size(t));
for i=1:x1
home, i

for j=1:x2
z(j)=abs(ts(i)-t(j));
end
[zmin,k]=min(z);
ts(i)=t(k);
ys(i)=y(k);
end
