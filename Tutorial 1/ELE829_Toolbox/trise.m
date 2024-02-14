%TRISE
% This program calculates the rise time tr (0 to 100%)
% based on equation: tr=pi-cos(zeta)^(-1)/wn/sqrt(1-zeta^2);
%
% tr=trise(zeta,wn);
% 
%  input  - zeta, damping ratio
%         - wn, frequency of natural oscillations in rad/sec
%  output - tr, rise time (0 to 100%) in seconds
%
% Last revision: February 2015           Dr. M.S. Zywno
function tr=trise(zeta,wn);
tr=(pi-acos(zeta))/wn/sqrt(1-zeta^2);
