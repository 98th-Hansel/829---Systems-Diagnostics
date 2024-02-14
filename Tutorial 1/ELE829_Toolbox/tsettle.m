%TSETTLE
% This program calculates the settling time
% based on equation: tsettle=no/zeta/wn  
% where no = 3 (2% definition) or 4 (5% definition)
%
% tsettle=tsettle(zeta,wn,no);
% 
%  input  - zeta, damping ratio
%         - wn, frequency of natural oscillations in rad/sec
%         - no = 3 or 4
%  output - ts, settling time in seconds
%
% Last revision: February 2015           Dr. M.S. Zywno
function ts=tsettle(zeta,wn,no);
ts=no/zeta/wn

