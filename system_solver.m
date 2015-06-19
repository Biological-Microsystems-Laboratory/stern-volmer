clear

syms B D C F x y v u

f1=(B/(1+3*D))+(C/(1+3*F))==5;
f2=(B/(1+13*D))+(C/(1+13*F))==15; 
f3=(B/(1+23*D))+(C/(1+23*F))==21; 
f4=(B/(1+D))+(C/(1+F))==1; 

%solve([x^2+y == 5, x^2+y^2 == 7],[x, y])

%[solB, solD, solC, solF] = solve([f1, f2, f3, f4], [B, D, C, F])

[solv, solu] = solve([2*u^2 + v^2 == 0, u - v == 1], [v, u])

%[y1, y2, y3, y4] = solve(f1,B);

%a = solve (list(f1,f2,f3,f4),list(B,C,D,F));

%subs(f1,list(B,C,D,F),a)