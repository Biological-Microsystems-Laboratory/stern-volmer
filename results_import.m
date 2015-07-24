clear
filename = 'results.txt';
delimiterIn = '\t';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);
intensities = A.data(:, 2);
M = size(intensities,1)/24;
wells = reshape(intensities,M,24);
%csvwrite('wells.csv',wells)
number_of_calibration_points = 5;
exposures_per_calibration = 10;
calibration_exposures = wells(1:[number_of_calibration_points*exposures_per_calibration],:);
calibration = zeros(number_of_calibration_points,24);
start = 1;
last = exposures_per_calibration;

for n = 1:number_of_calibration_points
   m = calibration_exposures(start:last,:);
   calibration(n,:) = mean(m);
   start = last+1;
   last = last+exposures_per_calibration;
end

%csvwrite('calibration.csv',calibration)
exp = wells(number_of_calibration_points*exposures_per_calibration+1:length(wells),:);

%%% Stern-Volmer
calibration_tanks = [0, 1, 7.5, 15, 21];
I1 = calibration(1,:);
I2 = calibration(number_of_calibration_points,:);
X1 = calibration_tanks(1);
X2 = calibration_tanks(number_of_calibration_points);
kt = (I2-I1)./((X1*I1)-(X2*I2)); % calculation for Ktau
I0 = I1;
x1 = [0:1:25]'; % makes x values for plot of stern-volmer
%stern_volmer_plot = x1*kt+1; % plots I0/I Vs oxygen
%intensity_plot = I0./(1+kt*x1); % plots intensity(I) Vs oxygen

for i = 1:24
    oxygen_percent(:,i) = ((I0(i)./exp(:,i))-1)/kt(i);
end

hold on
%for i= 1:24
%    plot(oxygen_percent(:,i))
%end
hold off
