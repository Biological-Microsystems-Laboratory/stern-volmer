Q = [ 0; 1; 10; 21;];
I = [ 2376.4; 2148.6; 1000.8; 736.52;];


plot(Q,I,'ro')

% I==I0.*(((f1)./(1+ksv1*x1))+((f2)./(1+ksv2*x1)))

%I = I0.*(((f(1)./(1+ksv(1)*q))+((f2./(1+ksv2*q)))

%x(1) = f(1)
%x(2) = ksv(1)
%x(3) = f(2)
%x(4) = ksv(2)

% F = @(x,xdata)x(1)*exp(-x(2)*xdata) + x(3)*exp(-x(4)*xdata);

F =@(x,xdata)(((x(1)))/(1+x(2)*xdata)+(x(3))/(1+x(4)*xdata))*2376.4;

x0 = [1 1 1 0];

[x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,Q,I)

hold on
plot(Q,F(x,Q))
hold off