 function [b]=acorrf(yk,L,PLOT);
%ACORRF
% This program calculates Autocorrelation Function Coefficients 
% for a specified lag L for a discrete sequence (yk);
% NOTE: If you validate a model (OE, BJ, etc), or use ACF for 
%       NOISE MODEL diagnostic, the sequence is RESIDUES 
%       If you use ACF for SYSTEM MODEL diagnostics, 
%       the sequence is OUTPUT
% ACF coefficients are normalized wrt coefficient at L=0; 
% 95 % Confidence Intervals are computed, ACF and 95 % CI are displayed.
%
% [b]=acorrf(yk,L,PLOT);
%
% b - b(:,1) contains lag index, b(:,2) contains ACF coeficients
%
%  PLOT - PLOT=0 gives no plots. PLOT=1 gives a plot of ACF coefficients
%  (Default: PLOT=1)     
%
% Last revision: July 5, 2018                     M.S. Zywno

%==========================================================================
%  Option for turning plot on/off 
%==========================================================================
if nargin<3
    PLOT=1;
end
% ----------------------------------------------------------------------
% check if yk is a row vector:
% ----------------------------------------------------------------------
yk=vector(yk,'row');
% ----------------------------------------------------------------------
% Compute ACF coefficients: 
% ----------------------------------------------------------------------
sigma=yk*yk';
zz=yk;
n=max(size(yk));
Y=zeros(L,n);
Y(1,:)=zz;
for k=2:L
  Y(k,k:n)=zz(1:(n-k+1));
end
for i=1:L
ACF(i)=Y(1,:)*Y(i,:)'/sigma;
end
LAGS=[0 1:L-1]';
b=[LAGS ACF'];
%[xx,yy]=lines(LAGS,ACF);
%
[xx,yy]=line_plot(LAGS,ACF);

%------------------------------------------------------------------
% compute 95 % confidence intervals for autocorrelation function 
%------------------------------------------------------------------
vr(1)=1/n;
vr(2)=1/n;
A(1)=0;
  for k=2:L
     A(k)=ACF(k)^2;
  end
Z=cumsum(A);
for j=3:L
vr(j)=1/n*(1+2*Z(j));
end
CI1=2*sqrt(vr);
CI2=-2*sqrt(vr);
%nn=max(size(ACF);
nn = max(size(xx));
C1 = zeros(nn,1);
C2 = zeros(nn,1);
C1(2:3:nn) = CI1;
C1(3:3:nn) = CI1;
C2(2:3:nn) = CI2;
C2(3:3:nn) = CI2;

%------------------------------------------------------------------
% plot ACF with 95 % confidence intervals 
%------------------------------------------------------------------
    if PLOT==1
        z1=max(ACF);z2=min(ACF);
        z3=max(C1);z4=min(C2);
        zz1=max(z1,z3);
        zz21=min(z2,z4);
        if abs(zz21)<0.1
            zz2=-0.2;
        else
            zz2=zz21;
                    end
        %dplot(ACF,1,C1,1,C2,1);
        bounds = [z3;z4];
            %lineHandles = stem(LAGS,ACF,'filled','b-o');
            %
            lineHandles = stem(xx,yy,'filled','b-o');
        set(lineHandles(1),'MarkerSize',3)
        grid('on')
        hold('on')
                 
        %plot(xx,yy,xx,C1,'.r',xx,C2,'.r')
        %plot(xx,C1,'.k',xx,C2,'.k')
         plot([0 0; L L],[bounds([1 1]) bounds([2 2])],'-.r');
        title('Autocorrelation function of yk with 95 % Confidence Limits')
        xlabel(['Number of Lags = ' num2str(L)])
     hold('off')
        %
        axis([-1 L+1 zz2 zz1]);
        %axis([-1 L -1.1 1.1])
    end
 end


