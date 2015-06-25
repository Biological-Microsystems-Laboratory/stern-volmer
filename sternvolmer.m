clear
load data.csv % data.csv is a single column of intensity data, with the first 4 elements as the two calibration points and corresponding concentration.

intensity_data=data; % enters loaded data into new matrix

I1 = intensity_data(1); % this defines the calibration data based on the element position.
X1 = intensity_data(2); % in the test-data elements 1 and 2 are the zero percent calibration point.
I2 = intensity_data(3); % elements 3 and 4 are the 21-percent calibration point.
X2 = intensity_data(4);


kt = (I2-I1)/((X1*I1)-(X2*I2)); % calculation for Ktau
I0 = (1+kt*X1)*I1;              % intensity in absence of quencher(0% O2)

x1 = 0:1:100; % makes x values for plot of stern-volmer

stern_volmer_plot = x1*kt+1;
%subplot(2, 2, 2)
%plot(stern_volmer_plot)
%title("Stern-Volmer Plot")

intensity_plot = I0./(1+kt*x1); % plots intensity curve.
subplot (2, 2, 1)
[hAx,hline1,hline2] = plotyy(x1,intensity_plot,x1,stern_volmer_plot);
xlabel('% O2')
ylabel(hAx(1),'intensity') % left axis
ylabel(hAx(2),'kt*X+1') % right axis




I = intensity_data(5:length(intensity_data),:);
oxygen_percent = ((I0./I)-1)/kt;
subplot(2, 2, 3)
plot(oxygen_percent)
xlabel('time')
ylabel('% O2')

f1 = 0;
f2 = 0.99;
ksv1 = 0.002318;
ksv2 = 0.1436;

a =(I0^2*f1^2*ksv2^2 + 2*I0^2*f1*f2*ksv1*ksv2 + I0^2*f2^2*ksv1^2 + 2*I0*I*f1*ksv1*ksv2 - 2*I0*I*f1*ksv2^2 - 2*I0*I*f2*ksv1^2 + 2*I0*I*f2*ksv1*ksv2 + I.^2*ksv1^2 - 2*I.^2*ksv1*ksv2 + I.^2*ksv2^2);
b = -I*ksv2 - I*ksv1 + I0*f1*ksv2 + I0*f2*ksv1;
c = (2*I*ksv1*ksv2);
Q = ((a.^(1/2))+b)./c;
subplot(2, 2, 4)
plot(Q)
title('Oxygen corrected')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Corrected Plots
corrected_SV_plot = 1./(((f1)./(1+ksv1.*x1))+((f2)./(1+ksv2.*x1))); 
corrected_intensity_plot = I0.*(((f1)./(1+ksv1*x1))+((f2)./(1+ksv2*x1)));
subplot(2, 2, 2)
[hBx,hline3,hline4] = plotyy(x1,corrected_intensity_plot,x1,corrected_SV_plot);
xlabel('% O2')
ylabel(hBx(1),'intensity') % left axis
ylabel(hBx(2),'I0*(f1/1+ksv1*x + f1/1+ksv2*x)') % right axis

%int= I0./(x1.*kt+1);
%figure
%plot(int)

%save percent.csv oxygen_percent % optional line for saving analyzed data to a file
