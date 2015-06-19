load data.csv % data.csv is a single column of intensity data, with the first 4 elements as the two calibration points and corresponding concentration.

intensity_data=data; % enters loaded data into new matrix

I1 = intensity_data(1); % this defines the calibration data based on the element position.
X1 = intensity_data(2); % in the test-data elements 1 and 2 are the zero percent calibration point.
I2 = intensity_data(3); % elements 3 and 4 are the 21-percent calibration point.
X2 = intensity_data(4);


kt = (I2-I1)/((X1*I1)-(X2*I2)); % calculation for Ktau
I0 = (1+kt*X1)*I1;              % intensity in absence of quencher(0% O2)

x1 = 0:1:100; % makes x values for plot of stern-volmer
intensity_plot = I0./(1+kt*x1); % plots intensity curve.
subplot (2, 2, 1)
[hAx,hline1,hline2] = plotyy(x1,intensity_plot,x1,stern_volmer_plot);
xlabel("% O2")
ylabel(hAx(1),"intensity") % left axis
ylabel(hAx(2),"kt*X+1") % right axis


stern_volmer_plot = x1*kt+1;
subplot(2, 2, 2)
plot(stern_volmer_plot)
title("Stern-Volmer Plot")

I = intensity_data(5:rows(intensity_data),:);
oxygen_percent = ((I0./I)-1)/kt;
subplot(2, 2, 3)
plot(oxygen_percent)
xlabel("time")
ylabel("% O2")

K=0.29489
m=0.664
oxygen_percent_corrected = exp((log((I0./I)-1)/K)/(m));

%figure
subplot(2, 2, 4)
plot(oxygen_percent_corrected)

%int= I0./(x1.*kt+1);
%figure
%plot(int)

%save percent.csv oxygen_percent % optional line for saving analyzed data to a file
