
%% Boutique Shop - customers arrive and are helped by an employee.
% The manager wants to know how long customers will wait, on average.

%% Tracking Arrivals and Departures only 
% (assumes no waiting for an employee to be free)

n = 10;
person = zeros(n,2);
t = 0;  % start time

for i = 1:n
    arrival = t + random('exp',40);
    duration = random('norm',25,5);
    person(i,:) = [arrival, arrival + duration];
    t = arrival;
end


%% Tracking Arrivals and When Customers are Being Helped
% (assumes 1 employee, so customers must wait for the previous to be done)

clear
%n = 10;
%person = zeros(n,4);
i = 1;
t = 0;  % start time

%for i = 1:n
while t < 420   % once shop has been open 7 hrs, take one more customer
    arrival = t + random('exp',40);     % person i arrives
    
    if i > 1
        start = max(arrival,person(i-1,3));
    else
        start = arrival;
    end
    
    wait = start - arrival;
    
    duration = random('norm',25,5);
    departure = start + duration;
    
    person(i,:) = [arrival, start, departure, wait];
    
    i = i + 1;      % prep for next customer
    t = arrival;    % set t as last arrival (for exp distribution)
    
end

mean(person(:,4))   % average wait time
size(person,1)      % number of customers helped

