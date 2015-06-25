clear
%pkg load symbolic
% this code works in octave with the syms package

syms f1 ksv1 Q f2 ksv2 I I0
%symQ = solve(f1/(1+ksv1*Q)+f2/(1+ksv2*Q)== I/I0, Q)
symI = solve(f1/(1+ksv1*Q)+f2/(1+ksv2*Q)== I/I0, I)
%SymQ2 = solve(I0*(f1/(Q*ksv1 + 1) + f2/(Q*ksv2 + 1))==I, Q)
SymQ3 = solve((I0/Q)*(f1/(ksv1 + 1) + f2/(ksv2 + 1))==I, Q)
% here is the solution to Q:
% Qsol = (I*(-I0*f1*ksv2 - I0*f2*ksv1 + I*ksv1 + I*ksv2 - sqrt(4*I*ksv1*ksv2*(I0*f1 + I0*f2 - I) + (I0*f1*ksv2 + I0*f2*ksv1 - I*ksv1 - I*ksv2)^2))/(2*ksv1*ksv2))
% or
% Qsol2 = (I*(-I0*f1*ksv2 - I0*f2*ksv1 + I*ksv1 + I*ksv2 + sqrt(4*I*ksv1*ksv2*(I0*f1 + I0*f2 - I) + (I0*f1*ksv2 + I0*f2*ksv1 - I*ksv1 - I*ksv2)^2))/(2*ksv1*ksv2))

% a = -I0*f1*ksv2 - I0*f2*ksv1 + I*ksv1 + I*ksv2
% b = 4*I*ksv1*ksv2*(I0*f1 + I0*f2 - I)
% c = (I0*f1*ksv2 + I0*f2*ksv1 - I*ksv1 - I*ksv2)
% d = 2*ksv1*ksv2
% Q = (I*(a-sqrt(b+c^2)))/d

% If I is a vector 
% a = -I0*f1*ksv2 - I0*f2*ksv1 + I*ksv1 + I*ksv2;
% b = (4*I*ksv1*ksv2).*(I0*f1 + I0*f2 - I);
% c = I0*f1*ksv2 + I0*f2*ksv1 - I*ksv1 - I*ksv2;
% d = 2*ksv1*ksv2;
% Q = (I.*(a+sqrt(b+c.^2)))/d;