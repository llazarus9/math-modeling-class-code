
%% COMPARE TO: ODEs_ode45_demo.m

%% Euler's Method - single ODE

t0 = 0; t1 = 1;     % time interval

k = 1;
f = @(t,y) k*y;     % RHS of 1st order DE
dt = 1/12;          % time step

t = zeros((t1-t0)/dt+1,1); % initialize
y = zeros((t1-t0)/dt+1,1); % initialize
t(1) = t0; y(1) = 1; % initial condition

for i=1:(length(y)-1)
    t(i+1)=t(i)+dt;
    y(i+1)=y(i)+dt*f(t(i),y(i));
    
end

tfull = 0:0.001:1;
actual = exp(k*tfull);

figure(1)
plot(t,y,'b-+',tfull,actual,'r')
title(['y(1)\approx',num2str(y(length(y)))])



%% Euler's Method - system of 2 ODEs

t0 = 0; t1 = 50;

%k = 1;
f = @(t,y) [y(2), -y(1)];  % RHS of 1st order DEs
dt = (t1-t0)/(50*128);     % time step

t = zeros((t1-t0)/dt+1,1); % initialize
y = zeros((t1-t0)/dt+1,2); % initialize
t(1) = t0; y(1,:) = [1 0]; % initial condition

for i=1:(length(y)-1)
    t(i+1)=t(i)+dt;
    y(i+1,:)=y(i,:)+dt*f(t(i),y(i,:));
    
end

figure(3)
plot(t,y(:,1),'b',t,y(:,2),'r')

