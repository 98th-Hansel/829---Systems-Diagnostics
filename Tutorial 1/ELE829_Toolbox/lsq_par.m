%LSQ_PAR
% parametric DT model from PRBS I/O sequence (uk,yk)
% Input:       n - assumed order of the system 
%              ndel - assumed number of delays 
%          z - I/O data in IDDATA format, i.e.  z = iddata(y,u,Ts)
%              where y,u are data samples
% Output: numd,dend - Z-transfer function of the discrete model
%
%        [numd,dend]=lsq_par(n,ndel,z);
%
% Last revision: August 31, 2013                     M.S. Zywno
% Modified by Raymond Phan to ensure variable order number
function [numd,dend]=lsq_par(n,ndel,z);
% z - IDDATA object
Ts=z.Ts;
yk=z.y;
uk=z.u;
%make sure that yk,uk are column vectors:
uk=vector(uk,'col');
yk=vector(yk,'col');

% strip the delays from output:
N = length(yk); % changed to make more efficient
yk=yk(ndel:N);
uk=uk(1:N-ndel+1);
N = length(yk);

% Create variable LSQ matrix
AN = [];

% First populate the LSQ matrix with the input values
for i = 0 : n
    AN = [AN uk(n+1-i:N-i)];
end

% Secondly, populate the LSQ matrix with the output values
for i = 1 : n
    AN = [AN -yk(n+1-i:N-i)];
end

% Generate RHS of matrix equation
Y = yk(n+1:N);

% Determine LSQ solution
x = pinv(AN)*Y;

% Extract numerator and denominator coefficients
numd = x(1:n+1)';
dend = [1 x(n+2:end)'];