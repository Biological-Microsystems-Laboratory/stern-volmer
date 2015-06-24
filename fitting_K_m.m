Q = [ 0; 1; 10; 21;];
I = [ 2376.4; 2148.6; 1000.8; 736.52;];
g = fittype('2376.4/(1+K*Q^m)','dependent',{'I'},'independent',{'Q'},'coefficients',{'K','m'});
myfit = fit(Q,I,g)
plot(myfit,Q,I)