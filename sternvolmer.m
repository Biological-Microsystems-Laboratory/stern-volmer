load data.csv % data.csv is a single column of intensity data, with the first 4 elements as the two calibration points and corresponding concentration.

intensity_data=data; % enters loaded data into new matrix

I1 = intensity_data(1); % this defines the calibration data based on the element position.
X1 = intensity_data(2); % in the test-data elements 1 and 2 are the zero percent calibration point.
I2 = intensity_data(3); % elements 3 and 4 are the 21-percent calibration point.
X2 = intensity_data(4);


kt = (I2-I1)/((X1*I1)-(X2*I2)); % calculation for Ktau
I0 = (1+kt*X1)*I1;              % intensity in absence of quencher(0% O2)

x1 = 0:1:100;              % makes x values for plot of stern-volmer
intensity_plot = I0./(1+kt*x1);        % plots stern-volmer. Check to see if its fitting your calibration points.
stern_volmer_plot = x1*kt+1;
plot(intensity_plot)
figure
plot(stern_volmer_plot)

oxygen_percent = ((I0./intensity_data(5:rows(intensity_data),:))-1)/kt;
K=kt
m=0.3
oxygen_percent_corrected = exp((log(I0./intensity_data(5:rows(intensity_data),:))/K)/m)
figure
plot(oxygen_percent)
figure
plot(oxygen_percent_corrected)

%int= I0./(x1.*kt+1);
%figure
%plot(int)

%save percent.csv oxygen_percent % optional line for saving analyzed data to a file
