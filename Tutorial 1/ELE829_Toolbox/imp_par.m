%IMP_PAR
% parametric DT model from impulse sequence yi
% Input: yi - sequence of impulse weights
%        n - assumed system order (from Hankel test)
% Output: numd,dend - Z-transfer function of the discrete model
%
%        [numd,dend]=imp_par(n,wi);
% 
% Last revision: August 31, 2013                     M.S. Zywno
function [numd,dend]=imp_par(n,yi);
m=max(size(yi));
wo=yi(1);
wk=yi(2:m);m=max(size(wk));
for i=1:n
for k=1:m-n
W(k,i)=wk(k+i-1);
B(k)=-wk(k+n);
end
end
Y=B';
bb=lsq(W,Y,'svd');
for i=1:n
b(i)=bb(n-i+1);
end
M=zeros(n+1);
M(:,1)=[1;b'];
for k=2:n+1
for i=2:n+1
M(i,k)=M(i-1,k-1);
end
end
wz=[wo; wk(1:n)];;
a=M*wz;
numd=a';,dend=[1 b];



