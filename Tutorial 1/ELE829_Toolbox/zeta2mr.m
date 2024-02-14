%MR2ZETA
% This program calculates the resonant frequency peak Mr
% given damping ratio based on equation: 
%              Mr=1/(2*zeta*sqrt(1-zeta^2));
%
%                    Mr=zeta2mr(z)
%
%  input - zeta, damping ratio
%  output  - mr, magnitude of resonant peak, in V/V units (!!)
%
% Last revision: January 2014            Dr. M.S. Zywno
function Mr=zeta2mr(z);
Mr=1/(2*z*sqrt(1-z^2));
