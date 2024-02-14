function [pout,z] = pzmap1(a,b,c,d)
%PZMAP	Plot pole-zero map of continuous-time linear system.
% OLD VERSION - 1997
%	PZMAP(A,B,C,D) computes the eigenvalues and transmission zeros of
%	the continuous-time state-space system (A,B,C,D) and plots them in
%	the complex s-plane.  The poles are plotted as x's and the zeros 
%	are plotted as o's.  
%
%	PZMAP(NUM,DEN) computes the poles and zeros of the SISO polynomial
%	transfer function G(s) = NUM(s)/DEN(s) where NUM and DEN contain 
%	the polynomial coefficients in descending powers of s.  If the 
%	system has more than one output, then the transmission zeros are 
%	computed.
%
%	PZMAP(P,Z) plots the poles, P, and the zeros, Z, in the complex 
%	plane.  P and Z must be column vectors.  When invoked with left
%	hand arguments,
%		[P,Z] = PZMAP(NUM,DEN)  or  [P,Z] = PZMAP(A,B,C,D)
%	returns the poles and transmission zeros of the system in the 
%	column vectors P and Z.  No plot is drawn on the screen.  
%
%	The function SGRID or ZGRID can be used to plot lines of constant
%	damping ratio and natural frequency in the s or z plane.
%
%	See also: RLOCUS,SGRID,ZGRID,EIG,TZERO,SS2ZP, and TF2ZP.
%
%	Clay M. Thompson  7-12-90
%	Revised ACWG 6-21-92
%	Copyright (c) 1986-93 by the MathWorks, Inc.
% last revised July 1997 	A-E-K "Nadji" Gali-Ngothe
if (nargin==0), eval('exresp(''pzmap'')'), return, end

error(nargchk(2,4,nargin));
if (nargin==3), error('Wrong number of input arguments.'); end

% --- Determine which syntax is being used ---
if (nargin==2),
	[nd,md] = size(b);
	if (md<=1),	% Assume Pole-Zero form
		p = a; z = b;
	else,		% Transfer function form
		[num,den] = tfchk(a,b);
		p = roots(den);
		[nn,mn] = size(num);
		if nn==1,
		    z = roots(num);
		else
		    [a,b,c,d] = tf2ss(num,den);
		    z = tzero(a,b,c,d);
		end
	end

else			% State space system 
	error(abcdchk(a,b,c,d));
	p = eig(a);
	z = tzero(a,b,c,d);

end

% If no output arguments then plot graph
if nargout==0,

	if ~isempty(z)
		plot(real(p),imag(p),'x',real(z),imag(z),'o')
	else
		plot(real(p),imag(p),'x')
	end
	
	xlabel('Real Axis'), ylabel('Imag Axis')

	% Draw real and imag axis
	status = ishold;
	hold on
	limits = axis;
	plot([0 0],limits(3:4),'w:',limits(1:2),[0 0],'w:');
	grid;
	if ~status, hold off, end	% Return hold to previous status
	return
end

pout = p;
