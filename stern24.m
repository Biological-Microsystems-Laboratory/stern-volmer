load Results.csv

r = reshape(Results(:,3), rows(Results)/24, 24);
save r.csv r
ss_mean = mean(r(1:10,:));
amb_mean = mean(r(11:15,:));
intensities = [ss_mean;zeros(1,columns(r));amb_mean;(ones(1,columns(r)))*24;r(11:rows(r),:)];

number_of_wells = columns (intensities); % finds the number of columns in the matrix
a = zeros (size (intensities));
b=0;
i=1;
for i = 1:columns (intensities)
   b=b+1;
   well = intensities(:,i);
   calibration_intensity1 = well(1);
   calibration_intensity2 = well(3);
   calibration_measurment1 = well(2);
   calibration_measurment2 = well(4);

kt = (calibration_intensity2-calibration_intensity1)/((calibration_measurment1*calibration_intensity1)-(calibration_measurment2*calibration_intensity2)); % calculation for Ktau

I0 = (1+kt*calibration_measurment1)*calibration_intensity1; % intensity in absence of quencher(0% O2)

x1 = 0:1:100;              % makes x values for plot of stern-volmer
y1 = I0./(1+kt*x1);        % plots stern-volmer. Check to see if its fitting your calibration points.

calculated_percent = ((I0./well)-1)/kt;
a(:,i) = calculated_percent;

endfor

eval = a(5:rows(a),:);

save -ascii evaluated.csv eval
