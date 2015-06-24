Q = [ 0; 1; 10; 21;];
I = [ 2376.4; 2148.6; 1000.8; 736.52;];
% (f1/(1+ksv1*Q))+(f2/(1+ksv2*Q))== I/I0
g = fittype('2376.4*((f1/(1+ksv1*Q))+(f2/(1+ksv2*Q)))','dependent',{'I'},'independent',{'Q'},'coefficients',{'f1','ksv1','f2','ksv2'});
%g = fittype('2376.4/(1+K*Q^m)','dependent',{'I'},'independent',{'Q'},'coefficients',{'K','m'});
myfit = fit(Q,I,g)
plot(myfit,Q,I)