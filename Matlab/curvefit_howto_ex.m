
load('howto_curvefit_exdata.mat')



%% curve-fitting (t,y)

figure(1), plot(t,y,'b*')
hold on

% looks fairly linear, so we try a linear (degree 1) fit:
coeffsy = polyfit(t,y,1)
% you can take a look at the slope and y-int values in the command window.

% generate predicted y values by 
% yfit = coeffsy(1)*t + coeffsy(2);
% or equivalently:
yfit = polyval(coeffsy,t);
plot(t,yfit,'r-')



%% curve-fitting (t,z)

figure(2), plot(t,z,'b*')
hold on

% looks like it could be exponential - let's check with a semilog plot.
figure(3), semilogy(t,z,'b*')
hold on

% Now we have a couple choices.

% Transformed Least Squares, Linear Fit:
% since (t, log(z)) looks linear, we fit a line in transformed space:
trlsq = polyfit(t,log(z),1);
lnz_trfit = polyval(trlsq,t);

% back to untransformed space, the predicted values:
z_trfit = exp(lnz_trfit);
figure(2), plot(t,z_trfit,'r-')
figure(3), semilogy(t,z_trfit,'r-')


% Least Squares for a General Function with Parameters:
% define model function f(t) = p1*(e^(p2*t)):
f = @(p,t) p(1)*exp(p(2)*t);

% make first guess at parameter values
% This might come from calculations or from plotting example functions 
% to see what looks good alongside the data.
p0 = [0.3 0.1];

% call in the built-in function!
pfit = lsqcurvefit(f,p0,t,z);
% returns pfit which should have the best fit values of p1 and p2.

% the predicted values of z from the fit can be found:
% z_lsqfit = pfit(1)*exp(pfit(2)*t);
% or equivalently, through the function handle:
z_lsqfit = f(pfit,t);

figure(4),plot(t,z,'b*',t,z_lsqfit,'k-')



%% Your turn -- how should we fit (t,v) and (t,w)?
