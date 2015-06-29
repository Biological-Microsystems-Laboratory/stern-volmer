Q = [ 0; 1; 10; 21;];
I = [ 2376.4; 2148.6; 1000.8; 736.52;];
% (f1/(1+ksv1*Q))+(1-f1/(1+ksv2*Q))== I/I0 ; f1+f2=1, f1=1-f2 f2=1-f1
g = fittype('2376.4*((1-f2/(1+ksv1*Q))+(f2/(1+ksv2*Q)))',...
            'independent',{'Q'},...
            'problem',{'f2'}';
myfit = fit(Q,I,g,'problem',{.99})
figure
plot(myfit,Q,I)
