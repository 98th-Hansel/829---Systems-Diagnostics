%CORREL
%correlation analysis impulse response estimates
% [wi]=correl(z,L,PLOT);
%          z - I/O data in IDDATA format, i.e.  z = iddata(yk,uk,Ts)
%              where yk,uk are data samples and Ts - sampling time
%  L -number of impulse weights to be computed
%  wi - computed impulse weights
%  PLOT - PLOT=0 gives no plots. PLOT=1 gives a plot of impulse weights
%  (Default: PLOT=1)     
% See also CRA, IMPWEIGH, DECRESP, IMP_PAR 
% 
% Last revision: August 31, 2013                     M.S. Zywno
%

%==========================================================================
% Modifications history:
%==========================================================================
%	o Added option for turning plot on/off - Oct. 24 , 2013 Vagif Veliev
%==========================================================================

function [wi]=correl(z,L,PLOT);
% z - IDDATA object
% Ts - sampling time can be recovered for scaling
if nargin<3
    PLOT=1;
end
Ts=z.Ts;
yk=z.y;
uk=z.u;
%make sure that yk,uk are column vectors:
uk=vector(uk,'col');
yk=vector(yk,'col');

[a]=acorrf(uk,L,PLOT);
[b]=ccorrf(uk,yk,L,PLOT);
ac=a(:,2);
N=max(size(ac));
R=zeros(N);
R(:,1)=ac(1:N);
for k=2:N
for i=2:N
R(i,k)=R(i-1,k-1);
end
for i=1:k-1
R(i,k)=R(k,i);
end
end
cc=b(N+1:2*N,2);
sy=std(yk);
su=std(uk);
wi=inv(R)*cc*sy/su;
if PLOT==1
    timeax1=[0:length(wi)-1]*Ts;
    stem(timeax1,wi);
    title('Impulse response estimate CORREL')
    xlabel('time in seconds')
end
end