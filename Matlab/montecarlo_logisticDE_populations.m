
%% Monte Carlo simulation of a logistic population with estimated parameters.

n = 150; % number of sims
sum = 0;
sumty = zeros(length(0:0.2:25),1);

figure, hold on

for i = 1:n
    r = random('norm',0.3,0.1);
    M = random('norm',1000,50);
    
    de = @(t,y) r*y*(1-y/M);
    [t,y] = ode45(de,0:0.2:25,20);
    
    sum = sum + y(end);
    sumty = sumty + y;
    plot(t,y)
end

% the "average" population -- i.e. if our estimates are correct
r = 0.3; M = 1000;
de = @(t,y) r*y*(1-y/M);
[t,y] = ode45(de,0:0.2:25,20);
plot(t,y,'b*')

sum/n                   % average end population
plot(t,sumty/n,'ko')    % average population over time


