%DPRBS
% generates a random switching sequence of discrete samples valued at 1 and -1
%
% N - number of sample points
% K - switch constant  in a number of samples - lowest K=1, highest K=N
% This program should be used for all identification subroutines dealing 
% with discrete systems 
%
% u=dprbs(N,K);
%
% Last revision: August 31, 2013                     M.S. Zywno
% See also: PRBS.
function u=dprbs(N,K);
k1=sign(randn(N,1));
ik=1;
for i=1:N
    if i <= ik*K
    u(i)=k1(ik);
    else
    ik=ik+1;
    u(i)=k1(ik);
    end
end
