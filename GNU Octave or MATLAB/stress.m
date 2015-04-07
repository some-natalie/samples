% Program to find 2D stress and shear at any angle
fprintf('Keep units consistent!  Give angles in degrees. \n');
% Inputs
sigx = input('sigma x:  ');
sigy = input('sigma y:  ');
tauxy = input('tau xy:  ');
alpha = input('alpha:  ');
% Solve
alpha = alpha * (pi/180);   % Convert degrees to radians
a = [(cos(alpha))^2 (sin(alpha))^2 sin(2*alpha); -0.5*sin(2*alpha) 0.5*sin(2*alpha) cos(2*alpha)];
b = [sigx; sigy; tauxy];
c = a*b;
% Print Solution
sigxp = c(1,1);
tauxyp = c(2,1);
fprintf('  sigma x prime = %f \n',sigxp);
fprintf('  tau xy prime = %f \n',tauxyp);
