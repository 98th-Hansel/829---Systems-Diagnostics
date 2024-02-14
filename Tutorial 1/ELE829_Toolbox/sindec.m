%SINDEC
% solves set of equations Ax = B by least squares approach
% using singular value decomposition method as a more robust numerical
% method compared to finding the pseudoinverse matrix
%
% input:  A,B equation matrices
% output: x - vector of solutions in the least squares sense
%
% [x]=sindec(A,B)
%     
% Last revision: August 31, 2013                     M.S. Zywno
%
function [x]=sindec(A,B);
n=min(size(A));
[u,s,v]=svd(A);
z=u'*B;
for k=1:n
r(k)=z(k)/s(k,k);
end
r=r';
x=v*r;
