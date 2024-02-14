%FACT
% This function computes factorial of an integer number, n!
%
%        [f]=fact(n);
% Last revision: January 2017            Dr. M.S. Zywno 
function [f]=fact(n);
if n==0
  f=1;
end 
f=1;
for k=1:n
f=f*k;
end
