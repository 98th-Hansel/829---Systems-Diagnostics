function [S,x]=chisq(L,ek,uk,PLOT);
%CHISQ
%Chi-Squared Test: test of "quality of identification" -
%overall test of significance of cross- or auto correlation (CCF or ACF)
%within 95% confidence limits; 
%
%          [S,x]=chisq(L,ek,uk,PLOT)
%
% input: - L number of lags
%          ek sequence of residuals computed for the model (see RESID)
%          uk input sequence 
% output:  S test statistic
%          x approximated Chi-Squared table entry for L degrees of freedom     %
% [S,x]=chisq(L,ek); computes test statistic for ACF of ek
% [S,x]=chisq(L,ek,uk); computes test statistic for CCF between uk and  ek
%
%  PLOT - PLOT=0 gives no plots. PLOT=1 gives a plot of impulse weights
%  (Default: PLOT=1)     
%
% Last revision: November 22, 2017                      M.S. Zywno    

%==========================================================================
% Modifications history:
%==========================================================================
%	o Added option for turning plot on/off - Nov. 12 , 2013 Vagif Veliev
%==========================================================================


N=max(size(ek));
if ((nargin<4)|(nargin==2))|((nargin==3)&(length(uk)~=1))
    PLOT=1;
end

N=max(size(ek));

if (nargin ==2)|((nargin==3)&(length(uk)==1))
  if (nargin==3)&length(uk)==1
      PLOT=uk;
  end    
  a=acorrf(ek,L,PLOT);
  r=a(:,2);

for i=2:L
s(i)=r(i)^2/(N-i);
%s(i)=r(i)^2;
end
else
  a=ccorrf(uk,ek,L,PLOT);
  r=a(L+1:2*L,2);
for i=1:L
s(i)=r(i)^2/(N-i);
%s(i)=r(i)^2;
end
end

S=N*(N+2)*sum(s);
%S=N*sum(s);

x=L+1.65*sqrt(2*L);


end


