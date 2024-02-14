% DELAY
% function [num,den]=delay(T,n);
%    This function generates a linear approximation of the delay
%    component e-sT, using TAYLOR series expansion, with n terms
%    included
% Input:  delay time T, n - number of terms
% Output: numerator, denominator of the Gdel(s) approximation
% see also: pade
%
% Last revision: January 2014         Dr. M.S. Zywno
function [num,den]=delay(T,n);
for k=1:n
x=fact(k);
num1(k)=1/x*(-T/2)^k;
den1(k)=1/x*(T/2)^k;
end
num1=[1 num1];
den1=[1 den1];
for j=1:n+1;
num(j)=num1(n+1-j+1);
den(j)=den1(n+1-j+1);
end
