k = 0: 0.5: 8;
h = 10.^ (-k);
p1 = 1.2 - h;
p2 = 1.2 + h;
f1 = sin(p1);
f0 = sin(1.2);
fminus1 = sin(p2);
fpp = -sin(1.2);
for m=1:length(k)
    fpp0(m) = (f1(m) - 2.* f0 + fminus1(m))/(h(m).^2);
    err(m) = abs(fpp0(m) - fpp);
end
 
h = log(h);
err = log(err);
figure(1);
plot(h, err);