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


oxygen_percent_standard = ((I0./timecourse_intensities)-1)/ksv;

% plotting for standard S-V
%subplot (2, 1, 1)
%[hAx,hline1,hline2] = plotyy(x1,intensity_plot,x1,stern_volmer_plot);
%hline1.Color = 'r';
%hline2.Color = 'b';
%title('Standard Stern-Volmer and Intensity Plot')
%xlabel('% O2')
%ylabel(hAx(1),'intensity') % left axis
%ylabel(hAx(2),'kt*X+1') % right axis

% plotting oxygen percent
%subplot(2, 1, 2)
%plot(oxygen_percent_standard)
%title('Oxygen for Standard Stern-Volmer')
%xlabel('time')
%ylabel('% O2')

%%% Two-Site Stern-Volmer fitting
Q = calibration_tanks';
I = calibration_intensities;
% This is the two-site model: (f1/(1+ksv1*Q))+(1-f1/(1+ksv2*Q))== I/I0 ; f1+f2=1, f1=1-f2 f2=1-f1
g = fittype('I0*((f1/(1+ksv1*Q))+((1-f1)/(1+ksv2*Q)))',...
            'independent',{'Q'},'dependent','I','problem','I0');
myfit = fit(Q,I,g,'problem',I0,'lower',[0 0 0],'upper',[1 inf inf],'Start',[0, 0, 0]);
coeff_twosite = coeffvalues(myfit)';
%hold on
%figure   
%plot(myfit,Q,I) % plots the fitting

%%%%% Calculation of oxygen from two site     
f1 = coeff_twosite(1);
f2 = 1-f1;
ksv1 = coeff_twosite(2);
ksv2 = coeff_twosite(3);
I = timecourse_intensities;
a =(I0^2*f1^2*ksv2^2 + 2*I0^2*f1*f2*ksv1*ksv2 + I0^2*f2^2*ksv1^2 + 2*I0*I*f1*ksv1*ksv2 - 2*I0*I*f1*ksv2^2 - 2*I0*I*f2*ksv1^2 + 2*I0*I*f2*ksv1*ksv2 + I.^2*ksv1^2 - 2*I.^2*ksv1*ksv2 + I.^2*ksv2^2);
b = -I*ksv2 - I*ksv1 + I0*f1*ksv2 + I0*f2*ksv1;
c = (2*I*ksv1*ksv2);
oxygen_percent_twosite = ((a.^(1/2))+b)./c;
%figure
%plot(oxygen_percent_twosite)

%%%% plotting

x = 0:1:21; % makes x values for plot of stern-volmer
stern_volmer_plot = (x*ksv+1)'; % values for I0/I Vs oxygen
intensity_plot = (I0./(1+ksv*x))'; % plots intensity(I) Vs oxygen
corrected_SV_plot = 1./(((f1)./(1+ksv1.*x))+((f2)./(1+ksv2.*x)))'; 
corrected_intensity_plot = I0.*(((f1)./(1+ksv1*x))+((f2)./(1+ksv2*x)))';
figure
subplot(2, 1, 1)
[AX,H1,H2] = plotyy(x,[corrected_intensity_plot,intensity_plot],x,[corrected_SV_plot,stern_volmer_plot]);
legend([H1;H2],'two-site int','standard int','two-site SV','standard SV');
LineArray = {'LineStyle'};
ValueLine = {'-','--'}';
ColorArray = {'Color'};
ValueColor = {'b','r'}';
ValueColor2 = {'r','b'}';
set(H1,LineArray,ValueLine,ColorArray,ValueColor)
set(H2,LineArray,ValueLine,ColorArray,ValueColor2)
title('Stern-Volmer Standard Vs. Two-Site Model')
xlabel('% O2')
ylabel(AX(1),'intensity') % left axis
ylabel(AX(2),'I0/I') % right axis

% plot timecourse data
subplot(2, 1, 2)
twosite = plot(oxygen_percent_twosite,'g');
hold on
standard = plot(oxygen_percent_standard,'m');
legend([twosite;standard],'two-site','standard');
title('Analyzed Time Course Data with 10% Oxygen Applied')
xlabel('time')
ylabel('% O2')