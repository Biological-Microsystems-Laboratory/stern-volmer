load data/050714/well1.LOG

z=well1;

% make a matrix named "z" with calibration intensities and percents for
% the first 4 elements( I1, %1, I2, %2, exp intensities) 

I1 = z(1);
I2 = z(3);
X1 = z(2);
X2 = z(4);

kt = (I2-I1)/((X1*I1)-(X2*I2)); % calculation for Ktau
I0 = (1+kt*X1)*I1;              % intensity in absence of quencher(0% O2)

x1 = 0:1:100;              % makes x values for plot of stern-volmer
y1 = I0./(1+kt*x1);        % plots stern-volmer. Check to see if its fitting your calibration points.
%plot(y1)
Opercent3 = ((I0./z)-1)/kt;
%figure
%plot(Opercent3)

save data/050714/well1a.txt Opercent3
