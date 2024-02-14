function [xo,yo] = line_plot(x,y)
%LINE_Plot	line graph.
%	LINE_PLOT(Y) draws a line graph of the elements of vector Y.
%	LINE_PLOT(X,Y) draws a line graph of the elements in vector Y at
%	the locations specified in X.  The X-values must be in
%	ascending order and evenly spaced.
%	[XX,YY] = LINE_PLOT(X,Y) does not draw a graph, but returns vectors
%	X and Y such that PLOT(XX,YY) is the line chart.
%	See also STAIRS and HIST.
% Last revision: August 31, 2013                     M.S. Zywno
               
n = length(x);
if nargin == 1
	y = x;
	x = 0:n-1;
end
delta = (max(x) - min(x)) / (n-1);
nn = 3*n;
yy = zeros(nn+1,1);
xx = yy;
t1 = x(:)' - 1e-8*delta;
t2 = x(:)' + 1e-8*delta;
xx(1:3:nn) = t1;
xx(2:3:nn) = x;
xx(3:3:nn) = t2;
yy(2:3:nn) = y;
xx(nn+1) = xx(nn);
if nargout == 0
    plot(xx,yy,x,y,'o')
else
	xo = xx;
	yo = yy;
end
