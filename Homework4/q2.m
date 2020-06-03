f = @(x) exp(x);
f2 = @(x) 2.*(x-1/2).*(x-1).*exp(0) - 4.*x.*(x-1).*exp(1/2) + 2.*x.*(x-1/2).*exp(1);

x1 = linspace(0, 1, 100);
y1 = f(x1);
y2 = f2(x1);

figure(1);
hold on
plot(x1, y1);
plot(x1, y2);
legend('actual function', 'interpolating function');
hold off

figure(2);
error = abs(y1-y2);
semilogy(x1,error);