%DPULSE
% generates a pulse sequence, switching at a rate K, 
% of discrete samples valued at 1 and -1
%
% N - number of sample points, K - number of samples between switches.
% if T - sampling period, then 2*K*T is the period of the pulse.
% This program should be used for  identification subroutines dealing 
% with discrete systems 
%
% u=dpulse(N,K);
%
% Last revision: August 31, 2013                     M.S. Zywno
% See also: PRBS.
function u=dpulse(N,K);
m=ceil(N/2/K);

  for i=1:K
     u(i)=1;
  end
  for i=K+1:2*K
     u(i)=-1;
  end

um=1;
for j=1:m
  um=[um u]; 
end

u=um(1:N);

stairs(u),title(['Pulse waveform, switch rate K = ' num2str(K)])
xlabel('Sample number')
axis([0 N -1.2 1.2])
