
%% estimating the area between f(x)>0 (example: a bell curve) and the x-axis

f = @(x) (1/sqrt(2*pi))*exp(-x^2/2);  % define the function

n = 1000;   % number of points to use - estimate will be better for larger N
count = 0;

% x = -1 + 2*rand(n,1);         % vectorized version
% y = rand(n,1);

for i = 1:n
    % generate -1 < x < 1 and 0 < y < 1 as separate random variables
    x = -1 + 2*rand;
    y = 0 + 1*rand;
    
    % if the point is in the desired area, count it
    if y <= f(x)
        count = count + 1;
    end
    
%     if y(i) <= f(x(i))          % vectorized version
%         count = count + 1;
%     end
end

% ratio (count/n) = (desired area / rectangle area)
A = (count/n)*(2*1)
