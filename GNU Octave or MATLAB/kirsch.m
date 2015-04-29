% Geological Engineering
% Program to find the general Kirsch solution.
%   The Kirsch solution is a plane strain 2D solution for the stresses surround-
%   ing a circular hole (ex. borehole or tunnel) in rock.
% Inputs
fprintf('Keep consistent units. Angle in degrees. \n');
fprintf('Stress in the Y (vertical) axis. \n');
sigy = input('  sigma_y = ');  % vertical stress
fprintf('Ratio of horizontal to vertical stresses, k. \n');
k = input('  k = ');  % stress ratio, k
fprintf('Distance of element from center of tunnel.  \n');
r = input('  r = ');  % distance from center to element
fprintf('Radius of tunnel. \n');
a = input('  a = ');  % radius of tunnel
fprintf('Angle from the positive **Y** axis to element, CCW, in degrees. \n');
theta = input('  theta = '); % angle in degrees
% Convert to radians
theta = theta.*(pi/180);
% Checks
if r<a
    fprintf('***ERROR***   Distance less than radius. \n');
end
% Terms to simplify equations
sigx = (sigy.*k);
r2 = (a.^2)./(r.^2);
r4 = (a.^4)./(r.^4);
% Solution
    % radial stress
sigr = (0.5.*(sigy+sigx).*(1-r2))+(0.5.*(sigy-sigx).*(1+(3.*r4)-(4.*r2).*cos(2.*theta)));
    % hoop stress
sigh = (0.5.*(sigy+sigx).*(1+r2))-(0.5.*(sigy-sigx).*(1+(3.*r4)).*cos(2.*theta));
    % shear stress
tau = 0.5.*(sigx-sigy).*(1-(3.*r4)+(2.*r2)).*sin(2.*theta);
% Outputs
fprintf('Radial Stress = %f \n',sigr);
fprintf('Hoop Stress = %f \n',sigh);
fprintf('Shear Stress = %f \n',tau);
