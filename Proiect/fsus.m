clc;
close all;

%declaram si initializam  variabilele de intrare  
R=1e+03;    %valorea rezistentei
C=1e-06;    %valorea condensatorului
A=10;       %valorea amplitudinii
%tip=1;      %1-RC in frecventa, 2-RC in timp

% setarea gradului frecventei minime si maxime pt functia logspace(min,max)   
min=1;
max=6;

% apel interfata
FTS(R, C, min, max, A);