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