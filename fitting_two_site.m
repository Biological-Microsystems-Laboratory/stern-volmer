Q = [ 0; 1; 10; 21;];
I = [ 2376.4; 2148.6; 1000.8; 736.52;];
% (f1/(1+ksv1*Q))+(f2/(1+ksv2*Q))== I/I0
g = fittype('2376.4*((f1/(1+ksv1*Q))+(f2/(1+ksv2*Q)))','dependent',{'I'},'independent',{'Q'},'problem',{'f1','f2'}','coefficients',{'ksv1','ksv2'});
%g = fittype('2376.4/(1+K*Q^m)','dependent',{'I'},'independent',{'Q'},'coefficients',{'K','m'});
myfit = fit(Q,I,g,'problem',{.23,.77})
plot(myfit,Q,I)