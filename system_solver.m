clear

syms f1 f2 ksv1 ksv2 x y v u

% (f1/(1+ksv1*Q))+(f2/(1+ksv2*Q))== I/I0

I0 = 2376.4;
Ione = 2148.6; % from analyzed data
Q1 = 1;
I10 = 1000.8;
Q10 = 10;
%I15 = 846; % eyeball estimate
%Q15 = 0.15;
I21 = 736.52;
Q21 = 21;

eq1=(f1/(1+Q1*ksv1))+(f2/(1+Q1*ksv2))==(Ione/I0);
eq2=(f1/(1+Q10*ksv1))+(f2/(1+Q10*ksv2))==(I10/I0);  
eq3=(f1/(1+Q21*ksv1))+(f2/(1+Q21*ksv2))==(I21/I0);
eq4= f1 + f2 == 1;

%solve([x^2+y == 5, x^2+y^2 == 7],[x, y])

[solf1, solf2, solksv1, solksv2] = solve([eq1, eq2, eq3, eq4], [f1, f2, ksv1, ksv2])


%[solv, solu] = solve([2*u^2 + v^2 == 0, u - v == 1], [v, u])

%[y1, y2, y3, y4] = solve(f1,B);

%a = solve (list(f1,f2,f3,f4),list(B,C,D,F));

%subs(f1,list(B,C,D,F),a)