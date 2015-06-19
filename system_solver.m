clear

syms f1 f2 ksv1 ksv2 x y v u

%% (f1/(1+ksv1*Q))+(f2/(1+ksv2*Q))== I/I0

eq1=(f1/(1+3*ksv1))+(f2/(1+3*ksv2))==5;
eq2=(f1/(1+13*ksv1))+(f2/(1+13*ksv2))==15; 
eq3=(f1/(1+23*ksv1))+(f2/(1+23*ksv2))==21; 
eq4=(f1/(1+ksv1))+(f2/(1+ksv2))==1; 

%solve([x^2+y == 5, x^2+y^2 == 7],[x, y])

%[solf1, solf2, solksv1, solksv2] = solve([eq1, eq2, eq3, eq4], [f1, f2, ksv1, ksv2])

[solv, solu] = solve([2*u^2 + v^2 == 0, u - v == 1], [v, u])

%[y1, y2, y3, y4] = solve(f1,B);

%a = solve (list(f1,f2,f3,f4),list(B,C,D,F));

%subs(f1,list(B,C,D,F),a)