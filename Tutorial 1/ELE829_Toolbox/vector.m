function x=vector(x,string);
%VECTOR
%This function ensures that a vector x is either a row vector -
% string = 'row'
% or a column vector -  string = 'col'
%  x=vector(x,'string');
%        
% Last revision: January 2014            Dr. M.S. Zywno
z=size(x);
if string(1)=='r'
   if z(2)==1
x=x';
   end
else
   if z(1)==1
x=x';
   end
end
