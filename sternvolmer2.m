clear
load timecourse_intensities.csv 
load calibration_intensities.csv
calibration_tanks = [0, 1, 7.5, 15, 21];

%%%%% Calculation for ksv
I0 = calibration_intensities(1); % intensity in absence of quencher
Ic = calibration_intensities(5);
Q0 = calibration_tanks(1);
Qc = calibration_tanks(5);
ksv = (Ic-I0)/((Q0*I0)-(Qc*Ic));

x1 = 0:1:25; % makes x values for plot of stern-volmer
stern_volmer_plot = x1*ksv+1; % values for I0/I Vs oxygen
intensity_plot = I0./(1+ksv*x1); % plots intensity(I) Vs oxygen

oxygen_percent_standard = ((I0./timecourse_intensities)-1)/ksv;

% plotting for standard S-V
subplot (2, 1, 1)
[hAx,hline1,hline2] = plotyy(x1,intensity_plot,x1,stern_volmer_plot);
hline1.Color = 'r';
hline2.Color = 'b';
title('Standard Stern-Volmer and Intensity Plot')
xlabel('% O2')
ylabel(hAx(1),'intensity') % left axis
ylabel(hAx(2),'kt*X+1') % right axis

% plotting oxygen percent
subplot(2, 1, 2)
plot(oxygen_percent_standard)
title('Oxygen for Standard Stern-Volmer')
xlabel('time')
ylabel('% O2')

%%% Two-Site Stern-Volmer fitting
Q = calibration_tanks';
I = calibration_intensities(1);
