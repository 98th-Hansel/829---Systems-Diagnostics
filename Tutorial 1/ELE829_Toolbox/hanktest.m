%HANKTEST
% Hankel Matrix test for the order of parametric model from impulse weights
% Input: wi - sequence of impulse weights
% Ndel - number of estimated delays in the Impulse weights sequence wi
% Explanation: delays are theoretically samples of 0 magnitude
% and they should be removed
% Output: determinants of Hankel matrices for n=1 to 7
%         if n is the order of the system, then Sdet(n+1) = 0
% i.e. the last non-zero value of determinant suggests order of the system
% Due to numerical roundoffs, watch for a large relative drop in the 
% determinant value as a clue.  
%  
% Scale of y-axis is logaritmic by default:
%
%                Sdet=hanktest(wi,Ndel);
%   Or set K = 1: 
%                Sdet=hanktest(wi,Ndel,K);
% 
%   To get a linear scale on y-axis, use K = 0
%
% 
% Last revision: May 1, 2018                     M.S. Zywno


%==========================================================================
%	Added option for ploting in logaritmic scale along Yaxis
%                                             
%==========================================================================
function Sdet=hanktest(wi,Ndel,K);

if nargin<3
    K=1;
end

M=max(size(wi));
Wi=wi(Ndel+1:M);
for k=1:7
c=Wi(1:k);
r=Wi(k:2*k-1);
S=hankel(c,r);
Sdet(k)=det(S);
a(k)=abs(det(S));
end

format long
disp(' ')
disp('Theoretically, if the order of the system is n, the Hankel matrix of order')
disp('(n+1) will have a zero determinant.')
disp('We should watch out for the')
disp('LAST NON-ZERO determinant of Hankel matrices. Due to numerical inaccuracies')
disp('the (n+1) determinant may not be exactly zero, so to identify the likely')
disp('order of the system, if Y-axis is LINEAR, watch for the Order followed by')
disp('the LARGE DROP in values of determinants of Hankel matrices')
disp('If Y-axis is LOGARITMIC, watch for the Order BEFORE the first significantly steeper slope!')
disp(' ')
disp('NOTE: The actual numerical value of the determinant is irrelevant as long')
disp('as it is non-zero.')
disp(' ')
disp(' ')
disp('System Order                         Test Result ')
disp('===============================')

disp(['order n = 1                              '   num2str(Sdet(1))])
disp(['order n = 2                              '   num2str(Sdet(2))])
disp(['order n = 3                              '   num2str(Sdet(3))])
disp(['order n = 4                              '   num2str(Sdet(4))])
disp(['order n = 5                              '   num2str(Sdet(5))])      
disp(['order n = 6                              '   num2str(Sdet(6))])
disp(['order n = 7                              '   num2str(Sdet(7))])

if K==0
set(gca,'YScale','lin')
hold('on')
lineHandles = stem([0:7],[0 a],'filled','b-o');
set(lineHandles(1),'MarkerSize',5)
%plot([0:7],[0 a],'r')
title('Hankel Test: Order at LAST significant NON-ZERO value')
xlabel('System Order Estimate')
hold('off')
end
if K==1
set(gca,'YScale','log')
%set(gca,'YScale','log','YDir','reverse')
hold('on')
lineHandles = stem([0:7],[0 a],'filled','b-o');
set(lineHandles(1),'MarkerSize',5)
plot([0:7],[0 a],'r')
title('Hankel Test: Order at LAST significant NON-ZERO value')
legend('LOG scale - Order before FIRST steep drop-off','location','SouthWest')
%legend('Look for the Order before the FIRST steep drop-off','location','SouthEast')
xlabel('System Order Estimate')
hold('off')
end

format short





