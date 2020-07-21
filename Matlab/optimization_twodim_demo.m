%% numerical search for optimum value of a 2d function by gradient ascent
 % example: f(x) = -13050+4550*x-700*x^2+3400*y-800*y^2+350*x*y;

f = @(x,y) -13050+4550*x-700*x^2+3400*y-800*y^2+350*x*y;

% gradient: choose one of the pairs below:
fx = @(x,y) 4550-1400*x+350*y;  % analytical partial derivatives
fy = @(x,y) 3400-1600*y+350*x;
%h = 0.01;          % for finite difference approximation
%fx = @(x,y) (f(x+h,y)-f(x,y))/h;
%fy = @(x,y) (f(x,y+h)-f(x,y))/h;

x = 1;          % initial choice may determine which optimum we find
y = 1;
fpx = fx(x,y); fpy = fy(x,y); % evaluate gradient at initial step

lambda = 0.001;   % step size scaling factor
maxmintog = 1;  % toggle this: 1 for max, -1 for min

% note that the magnitude of the gradient is sqrt(fx^2 + fy^2), so this is
% what we compare to zero for the closeness condition

while sqrt(fpx^2+fpy^2) > 0.01  % this affects tolerance
    
    xnew = x + maxmintog*lambda*fpx;     % step in x based on fx
    x = xnew;
    ynew = y + maxmintog*lambda*fpy;     % step in y based on fy
    y = ynew;
    
    % update gradient information for the next "while" condition check
    fpx = fx(x,y);
    fpy = fy(x,y);
end

[x y f(x,y)]  % print location and optimum value results to command window

