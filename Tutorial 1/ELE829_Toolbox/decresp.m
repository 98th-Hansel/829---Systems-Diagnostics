%DECRESP
%Computing system response to an arbitrary input, using a  non-parametric 
%impulse weights model
%
%    [y]=decresp(w,u);
%
%          u(i) - samples of input signal;
%          w(i) - model: impulse weights in column format
% Output:  y(i) - computed output sequence;  
% NOTE: make sure that the sizes of vectors u, w, are the same!!!
%
% Last revision: August 31, 2013                     M.S. Zywno
function [y]=decresp(w,u)
N=max(size(u));
A=zeros(N-1);
u=vector(u,'col');
A(:,1)=u(1:N-1);
for k=2:N-1
for i=2:N-1
A(i,k)=A(i-1,k-1);
end
end

Nw=max(size(w));

w1=w(1:Nw-1);
if Nw < N
nn=N-Nw;
zer=zeros(nn);
w=[w1;zer(:,1)];

B=A*w;
else

B=A*w1;
end

y=B;
y = [y;y(end)]; % Added by Ray Phan to pad the sequence with the 
                % last sample, ensuring that the size of the input 
                % is the same as the output
stem(y)
title('Arbitrary Response by Convolution of Input with Impulse Weights')
xlabel('Sample Number') % Corrected --> Not in time