function y=sat(A,x);
% sat is the saturation function with  limits -A,A  and unit slope.
%
%                y=sat(A,x);
%
% input:   A - saturation limits
%          x - signal to be limited               
% output:  y - saturated signal

%	Copyright (c) 1986-2013 by the MathWorks, Inc.
% last revised July 1997 	A-E-K "Nadji" Gali-Ngothe

N=max(size(x));
M=max(x);MM=min(x);
if M>A
   for i=1:N
         if x(i)>A
            y(i)=A;
         elseif x(i)<-A 
             y(i)=-A;
         else 
             y(i)=x(i);
         end
   end
elseif MM<-A
   for i=1:N
         if x(i)>A
            y(i)=A;
         elseif x(i)<-A 
            y(i)=-A;
         else 
            y(i)=x(i);
         end
   end
else
   y=x;
end