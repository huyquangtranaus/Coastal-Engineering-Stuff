function [Hs] = Check_hs_finite_water_depth(u10,x,d)
% @ Huy Quang Tran
% This function is used to calculate Hs based on Young and Verhagen (1996)
% parameterisations.
% For example, see this paper: https://www.sciencedirect.com/science/article/abs/pii/S0378383996000063
% Input parameters:
% u10: wind speed at 10-m height
% x: length of fetch
% d: water depth;

% Output: Hs: significant wave height

% Example:
%   Check_hs_finite_water_depth(21.9444,53890,7)
%    Hs = 1.6371

%% 1 - INPUT PARAMETERS
% u10=10;          % m/s
% x=60000;        % m
% d =5;               %m

%% 2-  CALCULATIONS

% Gravitational acceleration 
g =9.81;          % m/s^2

% Non-dimensional fetch
X = g*x/(u10^2);

% Scaling factor;
delta =  g*d/(u10^2);

% A1:  Equation  26 in Young and Verhagen (1996)
A1 =0.493 * (delta^0.75)   ;                                                

% B1:  Equation  27 in Young and Verhagen (1996)
B1 = 3.13 * (10^-3)*(X^0.57)   ;                                          

% Non dimensional energy:   Equation  25 in Young and Verhagen (1996)
e =  3.64 *(10^-3) *( tanh(A1) * tanh (B1/tanh(A1))  )^1.74 ;

% Total energy;
Etot =  e * (u10^4) / (g^2);

%% 3-  RESULTS: SIGNIFICANT WAVE HEIGHT
Hs =4 *sqrt(Etot)
end


