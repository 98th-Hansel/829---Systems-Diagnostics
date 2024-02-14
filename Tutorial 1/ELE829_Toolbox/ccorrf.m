function [b]=ccorrf(uk,yk,L,PLOT);
%CCORRF
% This program calculates Crosscorrelation Function Coefficients 
% for a specified lag L for (uk,yk) sequences.
% CCF coefficients are normalized wrt coefficient at L=0; 
% 95 % Confidence Intervals are computed, ACF and 95 % CI are displayed.
%
%                [b]=ccorrf(uk,yk,L,PLOT);
%
% b - b(:,1) contains lag index, b(:,2) contains CCF coeficients
%
%  PLOT - PLOT=0 gives no plots. PLOT=1 gives a plot of CCF coefficients
%  (Default: PLOT=1)     
%
% Last revision: September 14, 2021                      M.S. Zywno

%==========================================================================
%	Option for turning plot on/off 
%==========================================================================

if nargin<4
    PLOT=1;
end

% ----------------------------------------------------------------------
% check if uk,yk are row vectors:
% ----------------------------------------------------------------------
uk=vector(uk,'row');
yk=vector(yk,'row');
% ----------------------------------------------------------------------
% Compute all ACF coefficients for uk: 
% ----------------------------------------------------------------------
sigmau=uk*uk';
zz=uk;
n=max(size(uk));
Y=zeros(n,n);
Y(1,:)=zz;
for k=2:n
  Y(k,k:n)=zz(1:(n-k+1));
end
for i=1:n
ACFu(i)=Y(1,:)*Y(i,:)'/sigmau;
end
% ----------------------------------------------------------------------
% Compute all ACF coefficients for yk: 
% ----------------------------------------------------------------------
sigmay=yk*yk';
zz=yk;
n=max(size(yk));
Y=zeros(n,n);
Y(1,:)=zz;
for k=2:n
  Y(k,k:n)=zz(1:(n-k+1));
end
for i=1:n
ACFy(i)=Y(1,:)*Y(i,:)'/sigmay;
end
% ----------------------------------------------------------------------
% Compute CCF coefficients for positive lags: 
% ----------------------------------------------------------------------
sigma=sqrt(sigmau*sigmay);
zz=yk;
zz1=uk;
n=max(size(uk));
Y=zeros(L,n);
Y(1,:)=zz1;
for k=2:L
  Y(k,k:n)=zz1(1:(n-k+1));
end
for i=1:L
CCF(i)=zz*Y(i,:)'/sigma;
end
LAGS=[0 1:L-1]';
%------------------------------------------------------------------
% Compute CCF coefficients for negative lags: 
% ----------------------------------------------------------------------
zz=uk;
zz1=yk;
n=max(size(uk));
Y=zeros(L,n);
Y(1,:)=zz1;
for k=2:L
  Y(k,k:n)=zz1(1:(n-k+1));
end
for i=1:L
CCF1(i)=zz*Y(i,:)'/sigma;
end
LAGS1=[-L+1:1:0]';
cc=max(size(CCF1));
for i=1:cc
CCFn(i)=CCF1(cc-i+1);
end
lags=[LAGS1;LAGS];
ccf=[CCFn(1:cc)';CCF'];
b=[lags ccf];
[xx1,yy1]=line_plot(LAGS,CCF);
[xx,yy]=line_plot(lags,ccf);
size(xx);
size(yy);
%------------------------------------------------------------------
% compute 95 % confidence intervals for cross cocorrelation function 
%------------------------------------------------------------------
%  for k=2:n
   for k=2:L
     A(k)=ACFu(k)*ACFy(k);
  end
Z=cumsum(A);
psi=1+2*max(Z);
for i=1:L
  vr(i)=psi/(n-LAGS(i));
end
CI1=2*sqrt(vr);
CI2=-2*sqrt(vr);
mm=max(size(CI1));
%nn=max(size(CCF));
nn = max(size(xx1));
C1 = zeros(nn,1);
C2 = zeros(nn,1);
C1(2:3:nn) = CI1;
C1(3:3:nn) = CI1;
C2(2:3:nn) = CI2;
C2(3:3:nn) = CI2;
%------------------------------------------------------------------
% plot CCF with 95 % confidence intervals 
%------------------------------------------------------------------
cc=max(size(C1))-1;
for i=1:cc
C11(i)=C1(cc-i+1);
end
for i=1:cc
C12(i)=C2(cc-i+1);
end
CIp=[C11 C1'];
CIn=[C12 C2'];
if PLOT==1
    z1=max(ccf);z2=min(ccf);
    z3=max(CIp);z4=min(CIn);
    zz11=max(z1,z3);
    zz21=min(z2,z4);
    
    if abs(zz21)<0.1
            zz2=-0.1;
        else
            zz2=zz21;
    end
        
     if abs(zz11)<0.1
            zz1=0.1;
        else
            zz1=zz11;
        end
        LAGS=[1:2*L]';
        
        bounds = [z3;z4];
    
       %lineHandles = stem(LAGS,ccf,'filled','b-o');
       lineHandles = stem(xx,yy,'filled','b-o');
        %
        set(lineHandles(1),'MarkerSize',3)
        grid('on')
        hold('on')
        
    %dplot(CCF,1,CIp,1,CIn,1)
    %  plot(xx,yy,xx,CIp,'.b',xx,CIn,'.b')
       plot([0 0; L L],[bounds([1 1]) bounds([2 2])],'-.r');
       plot([0 0; -L -L],[bounds([1 1]) bounds([2 2])],'-.r');
       title('Cross correlation between uk,yk with 95 % Confidence Limits')
       xlabel(['Number of Lags = ' num2str(L)])
     hold('off')
        %
        axis([-L L zz2 zz1]);
    
   %axis([-L L 1.2*zz2 1.2*zz1])
   %axis([-L L -1.2 1.2]);
end

