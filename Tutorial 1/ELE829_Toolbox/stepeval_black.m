% STEPEVAL_BLACK
% This program evaluates the unit step response specs for 
% minimum-phase systems;
% NOTE - estimates for non-minimum phase systems may be erroneous
% for wd, Tring - use GINPUT function to collect appropriate values 
% directly off the screen and then use definitions. 
% 
% if the system description is known:
%
%      [PO,tp,tr19,tr01,ts5,ts2,ess,wd,tring]=stepeval_black(sys,tfin);
%
% if the measured data only is available:
%
%      [PO,tp,tr19,tr01,ts5,ts2,ess,wd,tring]=stepeval_black(t,y);
%
% Input parameters:     sys - system description or:
%                       t,y - unit step response (if your response is
%                             to input other than unit, normalize it).
% Output parameters:    PO - percent overshoot, in %
%                       tp - peak time
%                       tr19 - rise time between 10% & 90% of ss value
%                       tr01 - rise time between 0 & 100 % of ss value
%                       ts5 - settling time within 5% of ss value
%                       ts2 - settling time within 2 % of ss value
%                       ess - steady state error, in percent 
%                        wd - frequency of oscillations
%                       tring - period of oscillations
%                    
% Last revision: January 2014            Dr. M.S. Zywno
%
% Revision details whether or not the function outputs 
% a completely black plot for use with midterms / final exams, 
% and without displaying a legend 
% Specify 0 or 1 as the third parameter.  Omitting the 3rd parameter
% will generate the default plot with a legend and colour
% see also     RAMPEVAL
%
function [PO,tp,tr19,tr01,ts5,ts2,ess,wd,tring]=stepeval_black(A,B,black)

if nargin == 2
    black = 0;
end

if max(size(B))==1
   tfin=B;   sys=A;
  t=linspace(0,tfin,300);
t=vector(t,'col');
y=step(sys,t);
else
           t=A;y=B;
end


z=size(t);kz=max(z);
  yss=y(kz);
  ess=1-y(kz);
if abs(ess) < 5e-3
   ess=0;
end
  error=abs(ess)*100;
  for k=1:kz
      if yss-y(k)<0.9*yss
         t1=t(k);break
         end
  end
  for k=1:kz
      if yss-y(k)<0.001*yss
         tr01=t(k);break
      end
  end
  for k=1:kz
      if yss-y(k)<0.1*yss
         t2=t(k);break
      end
  end
  tr19=(t2-t1);
  for k=1:kz
      if abs(y(kz-k)-yss)>0.02*yss
          break
      end
  end
  ts2=t(kz-k);
  for k=1:kz
      if abs(y(kz-k)-yss)>0.05*yss
          break
      end
  end
  ts5=t(kz-k);
  [m,kp]=max(y);
  PO=(m-yss)*100/yss;tp=t(kp);
  if PO < 0
     PO = 0;tp=max(t);
  end

  count1=0;
count2=0;
for k=1:kz-1
  if y(k+1)<y(k)
     if count1==0
        t1=t(k);
        count1=1;
     end
  else
     if count1==1
        if count2==0
             t2=t(k);
             count2=1;
        end   
     end
  end
end
tring=2*(t2-t1);
wd=2*pi/tring;
if(black == 1)
    plot(t,y,'k',t,yss*exp(0*t),'k',t,0.9*yss*exp(0*t),'k',t,0.1*yss*exp(0*t),'k',t,0.98*yss*exp(0*t),'k-.',t,0.95*yss*exp(0*t),'k',t,1.02*yss*exp(0*t),'k-.',t,1.05*yss*exp(0*t),'k')
else    
    plot(t,y,t,yss*exp(0*t),t,0.9*yss*exp(0*t),t,0.1*yss*exp(0*t),t,0.98*yss*exp(0*t),'r-.',t,0.95*yss*exp(0*t),'m',t,1.02*yss*exp(0*t),'r-.',t,1.05*yss*exp(0*t),'m')
    legend('response','yss value','90 % of yss value','10 % of yss value','within 2 % of yss value','within 5 % of yss value',4)
end

title('System Step response')
    
grid,xlabel('time in sec')

disp(' ')
 disp('_____________________________________________________')
 disp('                   Summary of the response specs:')
 disp('_____________________________________________________')
 disp('')
 disp('   P.O.     Tpeak   Trise(0-100%)  Trise(10-90%) ')
 disp('_____________________________________________________')
 [PO tp tr01 tr19]
disp('')
ess=error;
 disp('_____________________________________________________')
 disp('Tsettle(2%)  Tsettle(5%)   wd     Tring     ess(in %)')
 disp('_____________________________________________________')
 [ts2 ts5 wd tring ess]






