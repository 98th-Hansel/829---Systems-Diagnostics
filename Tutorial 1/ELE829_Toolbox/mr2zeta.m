%MR2ZETA
% This program calculates the equivalent damping ratio zeta
% given the estimate of a resonant frequency peak Mr
% based on equation: Mr=1/(2*zeta*sqrt(1-zeta^2));
% 
% NOTE: If DC gain not 1, then sub Mr/Kdc as input 
%  zeta=mr2zeta(mr);
% 
%  input  - mr, magnitude of resonant peak, in V/V units (!!)
%  output - zeta, damping ratio
%  see also: PO2ZETA, TR2WN, TS2WN, WR2WN
%
% Last revision: January 2014    Dr. M.S. Zywno
function zeta=mr2zeta(mr);
r=roots([-4 0 4 0 -1/mr^2]);
zeta=abs(r(3));
