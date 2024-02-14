%EUCLNORM
% computes Euclidean norm of a matrix, defined as
% square root of a sum of squares of all matrix elements 
%
% m=euclnorm(a);
% Last revision: August 31, 2013                     M.S. Zywno
%
function m=euclnorm(a);
z=size(a);
n1=z(1);n2=z(2);
for i=1:n1
for k=1:n2
asq(i,k)=a(i,k)*a(i,k);
end
end
colsum=sum(asq);
totsum=sum(colsum);
m=sqrt(totsum);
