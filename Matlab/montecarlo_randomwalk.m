%% Galton Machine - random walks left/right - binomial/normal distribution

n = 10000; % number of balls
m = 14; % number of steps

balls = zeros(1,n);

for i = 1:n             % each ball falls down
    loc = balls(i);
    for j = 1:m         % at each step it can go left (0) or right (1)
        rand_walk = rand;
        if rand_walk < 0.5
            step = 0;
        else
            step = 1;
        end
        loc = loc + step;
    end
    balls(i) = loc;     % save the location of the i'th ball
end

% This comment contains a manual way of creating the counts for a
% histogram.  See if it makes sense!
%
% hist = zeros(1,m+1);
% for k = 1:m+1           
%     num = find(balls == k-1);     % which balls have location k-1
%     hist(k) = length(num)/n;      % how many (as a fraction of total)
% end
% 
% figure(1)
% plot(0:m,hist)          % relative frequency histogram
% hold on

figure(2)
h = histogram(balls,m+1,'BinLimits',[-0.5 m+0.5]);


