
%% COMPARE TO: ODEs_eulermethod_demo.m

%% ODE45 demo - single ODE

tspan = [0 1];    % time interval
y0 = 1;           % initial condition

k = 1;
foo = @(t,y) k*y; % this function is the f(t,y) in the DE

[t,y] = ode45(foo,tspan,y0);  
% calls DE func., tspan, initial condition
% outputs vector t of time values and corresponding vector y of y(t)

figure(2)
plot(t,y,'b')

%%

% ODE45 demo - system of 2 ODEs

% system: x1' = x2, x2' = -x1
% y is given as a vector with x1 and x2 as components

tspan = [0 50];
y0 = [1; 0];  % initial conditions for x1(0) and x2(0)

bar = @(t,y) [y(2); -y(1)];
% two components: dx1/dt and dx2/dt

[t,y] = ode45(bar,tspan,y0,odeset('MaxStep',0.01));

figure(4)
plot(t,y(:,1),'b',t,y(:,2),'r')  % x1(t) plotted in blue (first col of y)

