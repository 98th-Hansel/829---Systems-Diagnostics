%LSQ
%Least Squares solution to  A*x=Y
%
%    [x,P]=lsq(A,Y,'pse');
%    [x,P]=lsq(A,Y,'svd');
%
%    
%NOTE: Actual LS solution can be performed ether by using Pseudoinverse Matrix
%      or by Singular Value Decomposition.
%NOTE: Matrix P can be used to initialize Recursive Least Squares algorithm
%
% Last revision: August 31, 2013                     M.S. Zywno
function [x,P]=lsq(A,Y,F);
if F=='pse'
x=inv(A'*A)*A'*Y;
else
x=sindec(A,Y);
end
P=inv(A'*A);
