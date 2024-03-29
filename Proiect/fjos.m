clc;
close all;

%declaram si initializam  variabilele de intrare  
R=100;      %valorea rezistentei
C=1e-05;    %valorea condensatorului
tip=1;      %1-RC in frecventa, 2-RC in timp
A=30;       %valoarea amplitudinii

% setarea gradului frecventei minime si maxime pt functia logspace(min,max)   
min=1;
max=6;

% apel interfata
FTJ(R, C, min, max,tip,A);