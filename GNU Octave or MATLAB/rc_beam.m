% Program to analyze a rectangular reinforced concrete beam in bending
% ACI code compliant
% Constants
es = 29*10^6;			% elastic modulus of steel
% Inputs
fc = input('  F_c (ksi) = ');	% compressive strength of concrete
b = input('  b (in) = ');	% width of beam
d = input('  d (in) = ');	% depth of steel in beam
fy = input('  fy (ksi) = ');	% yield strength of steel
as = input('  As (in^2) = ');	% area of steel, in^2
% Conversions
fc = fc*1000;   % ksi to psi
fy = fy*1000;   % ksi to psi
% Solver 
ec = 57000*sqrt(fc);		% elastic modulus of concrete
if (fc <= 4000);		% stress depth factor, beta
	beta1 = 0.85;
	elseif (fc >= 8000);
	beta1 = 0.65;
	else
	beta1 = 0.85 - 0.05*((fc-4000)/1000);
endif
a = (as*fy)/(0.85*fc*b);	% depth of stress block
mn = (0.85*fc*b*a)*(d-(a/2));	% resisting moment of beam
rho = as/(b*d);			% reinforcement ratio, rho
rhomin = 200/fy;		% minimum reinforcement ratio
rhobal = beta1*((0.85*fc)/fy)*(0.003/(0.003+(fy/es)));	% balanced reinforcement ratio
rhomax = 0.75*rhobal;		% maximum reinforcement ratio
% Conversions
mn = mn/(12*1000);    % lb-in to k-ft
% Reinforcement Check
if rho<rhomin
    fprintf('***ERROR***   Not enough rebar! \n');
end
if rho>rhomax
    fprintf('***ERROR***   Too much rebar! \n');
end
% Print results
fprintf('Results \n');
fprintf('  Ec = %g (psi) \n',ec);
fprintf('  beta = %f \n',beta1);
fprintf('  a = %f (in) \n',a);
fprintf('  Mn = %f (kip-ft) \n',mn);
fprintf('  rho = %f \n',rho);
fprintf('  rhomin = %f \n',rhomin);
fprintf('  rhobal = %f \n',rhobal);
fprintf('  rhomax = %f \n',rhomax);
