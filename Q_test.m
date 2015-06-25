clear
I0=2376.4;
I = [ 2376.4; 2148.6; 1000.8; 736.52;];
f1 = 1;
f2 = .99;
ksv1 =  0.002318;
ksv2 =  0.1436;
a =(I0^2*f1^2*ksv2^2 + 2*I0^2*f1*f2*ksv1*ksv2 + I0^2*f2^2*ksv1^2 + 2*I0*I*f1*ksv1*ksv2 - 2*I0*I*f1*ksv2^2 - 2*I0*I*f2*ksv1^2 + 2*I0*I*f2*ksv1*ksv2 + I.^2*ksv1^2 - 2*I.^2*ksv1*ksv2 + I.^2*ksv2^2);
b = -I*ksv2 - I*ksv1 + I0*f1*ksv2 + I0*f2*ksv1;
c = (2*I*ksv1*ksv2);
Q = ((a.^(1/2))+b)./c;
I = 736.52;
Q2=((I0^2*f1^2*ksv2^2 + 2*I0^2*f1*f2*ksv1*ksv2 + I0^2*f2^2*ksv1^2 + 2*I0*I*f1*ksv1*ksv2 - 2*I0*I*f1*ksv2^2 - 2*I0*I*f2*ksv1^2 + 2*I0*I*f2*ksv1*ksv2 + I^2*ksv1^2 - 2*I^2*ksv1*ksv2 + I^2*ksv2^2)^(1/2) - I*ksv2 - I*ksv1 + I0*f1*ksv2 + I0*f2*ksv1)/(2*I*ksv1*ksv2);
Q3=-(I*ksv1 + I*ksv2 + (I0^2*f1^2*ksv2^2 + 2*I0^2*f1*f2*ksv1*ksv2 + I0^2*f2^2*ksv1^2 + 2*I0*I*f1*ksv1*ksv2 - 2*I0*I*f1*ksv2^2 - 2*I0*I*f2*ksv1^2 + 2*I0*I*f2*ksv1*ksv2 + I^2*ksv1^2 - 2*I^2*ksv1*ksv2 + I^2*ksv2^2)^(1/2) - I0*f1*ksv2 - I0*f2*ksv1)/(2*I*ksv1*ksv2);
% a = [1:1:4];
% b = [2:1:5];
% c = [3:1:6];
% Q3 = ((a.^(1/2))-b)./c;
% a = 1;
% b = 2;
% c = 3;
% Q4 = ((a.^(1/2))-b)./c;
Q
Q2
Q3
