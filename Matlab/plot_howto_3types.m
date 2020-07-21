
% parameters
C = 2;
k = 1;

% independent variable vector
t = 1:0.5:10;

% dependent variable vector built from t
% y = C./(t.^k);
% or, the mathematically equivalent expression:
y = C*t.^(-k);

% standard plot
plot(t,y,'b-o')

figure
% plot with logarithmic scale on y-axis
semilogy(t,y,'r*')

figure
% plot with logarithmic scale on both axes
loglog(t,y,'k--')
