%% Information
% CEE 5584 - Geotechnical Aspects of Earthquake Engineering
% Homework 3

% Clear existing data
clear all

%% Import acceleration history
% Note that for the assignment, instrument corrections were already performed, but baseline correction was not.
filename = 'AGW000.AT2';
delimiter = ' ';
startrow = 4;
raw = dlmread(filename,delimiter,startrow, 0); % 'dlmread' is used instead of 'importdata' function for compatibility reasons.
dt = 0.005;  % Time step for acceleration data
grav = 981;  % Gravitational constant, cm/s^2

%% Process acceleration history
rowcount = size(raw,1);
columncount = size(raw,2);
vsize = rowcount*columncount;
% Create a column vector from matrix values.  Assume values are from left-to-right, then down in the input file.
i = 1;  % counter
un_accel = zeros(vsize,1);  % initialize vector
for i=1:rowcount
    z = raw(i,:);
    z = z';
    un_accel (((i*columncount)-(columncount-1)):(i*columncount),1) = z;
    i = i + 1;
end

%% Set up the time vector
tmax = dt .* vsize;  % Max time of measurement, seconds
t = dt:dt:tmax;  % Time vector
t = t';

%% Linear Baseline Correction
% Least squares fit through recorded acceleration history
ca1 = polyfit(t,un_accel,1);
lsf_cor_accel = polyval(ca1,t);
cor_accel1 = un_accel - lsf_cor_accel ;
% Integrate for velocity
un_vel = zeros(vsize,1);
un_vel = (cumtrapz(t,cor_accel1));
% Least squares fit through velocity history
ca2 = polyfit(t,un_vel,1);
lsf_cor_vel = polyval(ca2,t);
cor_accel2 = cor_accel1 - ca2(1,1);
cor_accel3 = cor_accel2 .* grav;  % convert from Gs to cm/s^2
un_accel2 = un_accel.*grav;  % convert from Gs to cm/s^2
% *** Use cor_accel2 for Gs, cor_accel3 for cm/s^2! ***

%% Finding Velocity
cor_vel = zeros(vsize,1);
cor_vel = (cumtrapz(t,cor_accel3));
un_vel = zeros(vsize,1);
un_vel = (cumtrapz(t,un_accel2));

%% Find Displacement
cor_disp = zeros(vsize,1);
cor_disp = cumtrapz(t,cor_vel);
un_disp = zeros(vsize,1);
un_disp = cumtrapz(t,un_vel);

%% Duration using bracketed duration
abs_accel = abs(cor_accel2);
i = 1; j = 1;  % initialize counters
bt = 0.05;  % bracketed threshold, in Gs
t_abs_accel = zeros(size(abs_accel),1);
for i=1:(size(abs_accel))
    if abs_accel(i,1) > bt
        t_abs_accel(i,1) = t(i,1);
        if t_abs_accel(i,1) > 0
            t_abs_accel2(j,1) = t_abs_accel(i,1);
            j = j + 1;
        end
    end
    i = i+1;
end

%% Duration using 5-95% Husid plot
i = 1;  % initialize counter
k = zeros(vsize,1);
htop = zeros(vsize,1);
for i = 1:(vsize-1);
    k(i,1) = ((cor_accel2(i+1,1))^2 + (cor_accel2(i,1))^2) .* dt;
    htop(i,1) = sum(k);
end
hbottom = sum(k);
H_t = htop ./ hbottom;

%% Output
out1 = max(abs(cor_disp));  % PGD
out2 = max(abs(cor_vel));  % PGV
out3 = max(abs(cor_accel2));  % PGA in Gs
out6 = max(abs(cor_accel3));  % PGA in cm/s^2
out4 = out2 / out3;  % v/a
out5 = (out6 * out1) / (out2 * out2);  % ad/v^2
out7 = max(t_abs_accel2) - min(t_abs_accel2);
fprintf('Results \n');
fprintf('   PGA = %f (Gs) \n', out3);
fprintf('   PGV = %f (cm/s) \n', out2);
fprintf('   PGD = %f (cm) \n', out1);
fprintf('   v/a = %f ((cm/s)/Gs) \n', out4);
fprintf('   ad/v^2 = %f \n', out5);
fprintf('   Duration using Brackets at 0.05g = %f (s) \n', out7);

%% Graphs
% Acceleration Time History (in units of Gs)
plot(t,cor_accel2,'-b','linewidth',2); 
grid; 
title('Acceleration Time History','fontsize',16); 
xlabel('Time (s)','fontsize',14); 
ylabel('Acceleration (G)','fontsize',14);

% Velocity Time History (in units of cm/s)
plot(t,cor_vel,'-b','linewidth',2);
grid;
title('Velocity Time History','fontsize',16);
xlabel('Time (s)','fontsize',14);
ylabel('Velocity (cm/s)','fontsize',14);

% Corrected and uncorrected displacement time history (in units of cm)
plot(t,cor_disp,'-b','linewidth',2);
grid;
title('Displacement Time History','fontsize',16);
xlabel('Time (s)','fontsize',14);
ylabel('Displacement (cm)','fontsize',14);

% 5-95% Husid plot
plot(t,H_t,'-b','linewidth',2);
grid;
title('Husid Plot','fontsize',16);
xlabel('Time (s)','fontsize',14);
ylabel('H(t)','fontsize',14);
