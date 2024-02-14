function [response] = m_servo(u,mode,Station,Kp);
%==========================================================================
%           M Servo
%
% Author:       Geoffrey McVittie
% Date:         Feb. 1st, 2006
% Version:      1.2
% Revision:     1
%
%==========================================================================
%
% Purpose:      This routine is desined to model the operationof the servos
%               in room ENG413. It is also capabable of interfacing 
%               directly with the actual servos in the same lab. 
% 
% Operation:    'u' is the input data column vector for the servo. The
%               value of 'u' must be real numbers.
%               'Kp' is the proportional gain of the controller. 'K' must 
%               be a real number. Defaults to 1.0.
%               'Station' is the gain of the servo's power amplifier. An 
%               even number will have a gain of 2.25. An odd number will 
%               have a ain of 1.00. 'No' must be an integer. Defaults to 1.
%               'mode' will set the function as either a simulation or as
%               an interface with the actual servo. The interface mode will
%               only work in room ENG413. The value of 'mode' must be a
%               string of either 'sim' or 'real'. Defaults to simulation.
%
% Required Functions:   DLaBEtoR.m
%                       DLaBVtoD.m
%                       mInitialize.m           Initialize.m
%                       mTerminate.m            Terminate.m
%                       mReadEncoder.m          ReadEncoder.m
%                       m1DtoA.m                DtoA.m
%                       m2DtoA.m
%
%==========================================================================

%==========================================================================
%           Error Checking
%==========================================================================
if (nargin == 1)
    mode = 'sim';
    Station = 1;
    Kp = 1.0;
elseif (nargin == 2)
    Station = 1;
    Kp = 1.0;
elseif (nargin == 3)
    Kp = 1.0;
elseif (nargin > 4)
    error('Too many input arguments.');
elseif (nargin < 1)
    error('Too few input arguments.');
end

[dumb, no_samples] = size(u);

if (strcmp(mode,'sim') || strcmp(mode,'real')) == 0
    error('Incorrect mode. Mode must be either sim or real.');
end

if ((Station == 1) || (Station == 2)) == 0
    error('Station No. must be a positive integer');
end

if dumb ~= 1
    error('Incorrect size input array. u must be a column vector.');
end

%==========================================================================
%           Main program
%==========================================================================

Fs = 500.0;
Ts = 1.0/Fs;
Tf = no_samples/Fs;

% Unit Conversions
deg2rad = pi/180;
rad2deg = 180/pi;

% Initialize the vectors
ref = deg2rad*u;
t = 0:Ts:Tf-Ts;
Ns = no_samples;

% Initialize the Servo
if strcmp(mode,'sim') == 1
    servo = mInitialize(Fs);
else
    servo = Initialize(Fs);
end

% Run the Servo
for k = 1:Ns,
    if strcmp(mode,'sim') == 1
        motor_acc = mReadEncoder(servo);
    else
        motor_acc = ReadEncoder(servo);
    end
    motor_rad = DLaBEtoR(motor_acc);
    e_n = ref(1,k) - motor_rad;
    Va = Kp*e_n;
    if strcmp(mode,'sim') == 1
        if Station == 2
            m2DtoA(servo,DLaBVtoD(Va));
        else
            m1DtoA(servo,DLaBVtoD(Va));
        end
    else
        DtoA(servo,DLaBVtoD(Va));
    end
    theta(k) = motor_rad;
end;

% Clears the voltage register, stops the servo
if strcmp(mode,'real') == 1
    DtoA(servo,DLaBVtoD(0));
end

% Shut-down the Servo
if strcmp(mode,'sim') == 1
    mTerminate(servo);
else
    Terminate(servo);
end

% Compile Output Data
theta = rad2deg*theta;
response = [t;u;theta];

