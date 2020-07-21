%% numerical search for optimum value of a 1d function by gradient ascent
 % example: f(x) = 3*cos(x) - x;
 % note this function has infinite local maxes and mins

f = @(x) 3*cos(x)-x;

% choose one of the below methods for finding slope
fprime = @(x) -3*sin(x)-1; % analytical derivative
%h = 0.01; fprime = @(x) (f(x+h)-f(x))/h; % finite difference approximation

x = 1;            % initial choice may determine which optimum you find
fp = fprime(x);   % evaluate gradient at first step

lambda = 0.1;   % step size scaling factor
maxmintog = 1;  % toggle this: 1 for max, -1 for min

while abs(fp) > 0.01        % this affects tolerance - how close to be
    
    xnew = x + maxmintog*lambda*fp;     % step
    x = xnew;                           % update location
    
    fp = fprime(x);       % find new slope for the "while" condition
    
end

t = -10:0.01:10;
plot(t,f(t),'r',x,f(x),'bo')  % plot the max/min on the function itself

[x f(x)]  % print location and optimum value results to command window

