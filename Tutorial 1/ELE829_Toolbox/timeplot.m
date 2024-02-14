% TIMEPLOT
% This program will display the actual measured I/O data 
% and display it together with the estimated LTI model 
% response on one plot.
% 
%              y=timeplot(sys,tm,um,ym);
%
% Input parameters:     sys      - LTI model
%                       tm,um,ym - time, input, output vectors
%
% Output parameter:    y       - simulated model response
%
% Last revision: August 31, 2013                     M.S. Zywno
function y=timeplot(sys,tm,um,ym);
y=lsim(sys,um,tm);
plot(tm,um,tm,ym,tm,y),grid
xlabel('                        time in sec')
title('Comparison of model response vs measurements:')
legend('Input','Measured Output','Model Response',0);
