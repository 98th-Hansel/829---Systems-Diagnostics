%TSAMPLER
% This subroutine will sample an arbitrary time response (t,y)
% with a specified number of sampling points, N, thus creating
% a shorter pair of signals, (ts,ys):
%
%              [ts,ys]=tsampler(N,t,y);
% see also: TSAMPLE1, FSAMPLER, FSAMPLE1, LINES
%
% Last revision: August 31, 2013                     M.S. Zywno
function [ts,ys]=tsampler(N,t,y);
x1=max(size(t));
x2=floor(x1/N);
x3=floor(x1/x2);
i=1;
n(1)=1;
for k=2:x3
i=i+x2;
n(k)=i;
end
for k=1:x3
ts(k)=t(n(k));
ys(k)=y(n(k));
end
