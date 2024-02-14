%RECT2POL
% This program calculates the magnitude and phase in degrees
% of the complex number s from its rectangular form
%
% [M,Phdeg]=rect2pol(s);
%
% input  - s = alpha+j*beta
% output - M - magnitude, Ph - angle in degrees
%
% Last revision: August 31, 2013      M.S. Zywno
function [M,Ph]=rect2pol(s);
M=abs(s);Ph=angle(s)*180/pi;