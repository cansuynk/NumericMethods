n=161;                                %161 equidistant points
bound1=1.92; bound2=2.08;             %Interval bounds
step = (bound2 - bound1)/(n - 1);     %Calculating the number of equal pieces
x = (bound1 : step : bound2);         %Dividing the interval to these equal pieces  


%Expanded form of the polynomial function
f = x.^9 - 18*x.^8 + 144*x.^7 - 672*x.^6 + 2016*x.^5 - 4032*x.^4 + 5376*x.^3 - 4608*x.^2 + 2304*x.^1 - 512;

subplot(2,1,1)
%figure(1)
plot(x,f);          %Plotting the expanded form of the function
xlabel('x')         %Giving names to the x and y labels
ylabel('f(x)')
grid

%Calculating the polynomial function directly 
g = (x-2).^9;

subplot(2,1,2)
%figure(2)
plot(x,g);          %Plotting the closed form of the function
xlabel('x')         %Giving names to the x and y labels
ylabel('g(x)')
grid