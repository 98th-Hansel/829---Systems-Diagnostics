% ELE829 - System Modeling and Identification Toolbox
% **********************************************************
% *                    ELE829 TOOLBOX                      *     
% *  Fall 2021                                          *
% *                                        RYERSON         *
% *   M.S. ZYWNO                            UNIVERSITY     *
% *                                                        *
% *                                                        *
% *   This Toolbox will be periodically updated            *
% *                                                        *
% *                     LAST REVISION: October 3, 2021     *
% *                                                        *
% **********************************************************
%
%   Correlation Analysis:
%   acorrf    - calculates auto-correlation function (ACF) coefficients.
%   ccorrf    - calculates cross-correlation function (CCF) coefficients.
%   pacorrf   - calculates partial auto-correlation function (PACF) coefficients.
%   arma_ch   - displays pole-zero map of noise filter, impulse resp & ACF
%
%   Diagnostic Tools:
%   chisq       - computes Ch-Squared value.
%   hanktest    - computes Hankel test
%
%   Non-Parametric Time Domain Models:
%   correl    - impulse response weights using correlation method.
%   decresp   - response from impulse weights using convolution.
%   impweigh  - impulse response weights from deconvolution.
% 
%   Parametric Time Domain Models:
%   imp_par   - computes DT model from impulse weights.
%   lsq_par   - computes Least Squares DT model from impulse weights.
%   sindec    - solves equations using singular value decomposition
%
%   Plotting:
%   dplot     - plots up to 5 digital sequences.
%   line_plot - line graph for sampled sequence.
%   timeplot  - displays measured I/O data with LTI model response on one plot.
%
%   Signal Generation:
%   dprbs     - generates a discrete PRBS signal.
%   prbs      - generates a continuous PRBS signal.
%   dpulse    - generates a discrete pulse signal.
%   tsampler  - samples CT system with a set number of points.
%   tsample1  - samples CT system at set points of time.
%
%   Miscellaneous:
%   delay     - approximates delay term using Taylor series.
%   fact      - calculates the factorial; called by "delay".
%   sat       - simulates saturation block.
%   euclnorm  - computes Euclidean matrix norm.
%   sindec    - solves Least Squares problem by SVD method.
%   vector    - ensures that a vector x is either a row or a column vector.
%               vector is also called by "stepeval".
%   rect2pol  - conversion of coordinates - rectangular to polar.
% 
%   ELE639:
%   wr2wn     - calculates wn given resonant frequency wr
%   zeta2mr   - calculates damping ratio from Mr
%   mr2zeta   - calculates Mr from damping ratio
%   zeta2po   - calculates PO from damping ratio
%   po2zeta   - calculates damping ratio from PO
%   ts2wn     - calculates wn given Settling Time
%   tr2wn     - calculates wn given Rising Time
%   stepeval  - get specs from a step response
%   rampeval  - get specs from a ramp response





