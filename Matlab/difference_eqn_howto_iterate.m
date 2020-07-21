%% difference equation iteration

n = 10;
a = zeros(1,n+1); % initialize / pre-allocate

% parameter(s) & initial condition(s)
%r = 3.3; a(1) = 0.1;   % logistic example
a(1) = 18;

% iterate
for j = 2:(n+1)
    %a(j) = r*a(j-1)*(1-a(j-1));    % logistic map
    %a(j) = a(j-1) + 1;
    %a(j) = a(j-1) + (j-2);
    %a(j) = 2*a(j-1);
    a(j) = 0.5*a(j-1) + 1;
end

figure, plot(0:n,a,'k-*')

%% difference equation map

%f = @(a) 2*a;
f = @(a) 0.5*a + 1;

g = @(a) a;

t = -1:0.1:5;
figure, plot(t,f(t),'r',t,g(t),'k')
