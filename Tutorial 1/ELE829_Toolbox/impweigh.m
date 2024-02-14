%IMPWEIGH
%Obtaining impulse weights from arbitrary system response by deconvolution.
%
%    [w]=impweigh(u,y,PLOT);
%
%          u, y - samples of input and output signals
%              
% Output:  w       - normalized impulse weights (DT)
%
%  PLOT - PLOT=0 gives no plots. PLOT=1 gives a plot of impulse weights
%  (Default: PLOT=1)   
%
% Also see: DECRESP
%
% Last revision: August 31, 2013                     M.S. Zywno


%==========================================================================
% Modifications history:
%==========================================================================
%	o Added option for turning plot on/off - Oct. 24 , 2013 Vagif Veliev
%==========================================================================

function [w]=impweigh(u,y,PLOT);
if nargin<3
    PLOT=1;
end
y=vector(y,'col');
u=vector(u,'col');
z=[y u];
[N,nz]=size(z);

B=y(2:N);
A=zeros(N-1);
A(:,1)=u(1:N-1);
for k=2:N-1
for i=2:N-1
A(i,k)=A(i-1,k-1);
end
end
w=[0; inv(A)*B];
if PLOT==1
    stem(w);
    title('Impulse response estimate Deconvolution (non-robust)')
    xlabel('Recovered Lags (samples)')
end
end




