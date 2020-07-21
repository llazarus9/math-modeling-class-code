
%% flip a fair coin n times & record the number of heads (or tails)

n = 10;     % number of coin flips
count = 0;  % initialize

for i = 1:n
    x = rand;   % generate uniformly distributed random number in (0,1)
    
    if x > 0.5  % if a head (or tail) increase the count
        count = count + 1;
    end
end

count       % print counter to command window


%% roll a 6-sided die n times & record all results

n = 1000;
count = [0 0 0 0 0 0];

for i = 1:n
    x = rand;
    
    % adjust the cumulative probabilities for unfair dice
    if x <= 1/6         % roll a 1
        count(1) = count(1) + 1;
    elseif x <= 2/6     % roll a 2
        count(2) = count(2) + 1;
    elseif x <= 3/6     % roll a 3
        count(3) = count(3) + 1;
    elseif x <= 4/6     % roll a 4
        count(4) = count(4) + 1;
    elseif x <= 5/6     % roll a 5
        count(5) = count(5) + 1;
    else                % roll a 6
        count(6) = count(6) + 1;
    end
end

count       % print counters
count/n     % print percentages


%% using other Matlab built-in randomness

x = randi(6,1);     % rolls a fair die - integers (IMAX,N) or ([IMIN,IMAX],N)
y = randn;          % standard normal distribution - (M,N) gives mxn array
z = mu + sigma*randn;       % other normal distribution
