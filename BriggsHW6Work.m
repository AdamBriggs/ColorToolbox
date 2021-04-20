% % Adam Briggs
% % OPT 222 HW 6
load GAM_CYM.mat
load cie
C = GAM_CYM(:,1)./100;  %In decimal transmission
Y = GAM_CYM(:,2)./100;
M = GAM_CYM(:,3)./100;

n = 1.5; %Index of refraction
K1 = (1-n)./(1+n).^2;   %Reflection assuming in air
c = 1;    %Concentration
b = 0.1;    %Thickness in [mm]

Tinternal = @(Tlam) (-1.*(1-K1).^2+sqrt((1-K1).^4 + 4.*K1.^2.*Tlam.^2))...
    ./(2.*K1.^2.*Tlam);

figure(1)
hold on
plot(cie.lambda,C,'c');
plot(cie.lambda,M,'m');
plot(cie.lambda,Y,'g');
plot(cie.lambda,Tinternal(C),'c--');
plot(cie.lambda,Tinternal(M),'m--');
plot(cie.lambda,Tinternal(Y),'g--');
legend('Cyan T','Magenta T','Yellow T','Cyan T Internal', ...
    'Magenta T Internal','Yellow T Internal','Location','Best');
title('Transmission');
xlabel('Wavelength (nm)');
ylabel('Transmission (%)')
axis([380 780 0 1]);
set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
  'LineWidth'   , 1         );
set(gcf, 'PaperPositionMode', 'auto');

%% Need to solve for Alam 
AlamC = -log10(Tinternal(C));
AlamM = -log10(Tinternal(M));
AlamY = -log10(Tinternal(Y));

alphaC = AlamC./(b.*c);
alphaM = AlamM./(b.*c);
alphaY = AlamY./(b.*c);

% 70C/30Y
A_C70 = alphaC.*b.*(.7);    %Concentration 70%
A_Y30 = alphaY.*b.*(.3);    %Concentration 30%
% 50M/50C
A_M50 = alphaM.*b.*(.5);    %Concentration 50%
A_C50 = alphaC.*b.*(.5);    %Concentration 50%
%80M/80Y
A_M80 = alphaM.*b.*(.5);    %Concentration 50% -- Normalized to 1%
A_Y80 = alphaY.*b.*(.5);    %Concentration 50% -- Normalized to 1%

A_Mix1 = A_C70 + A_Y30;
A_Mix2 = A_M50 + A_C50;
A_Mix3 = A_M80 + A_Y80;

T_internal_Mix1 = 10.^(-A_Mix1);
T_internal_Mix2 = 10.^(-A_Mix2);
T_internal_Mix3 = 10.^(-A_Mix3);

Tlam = @(Tinternal) ((1-K1).^2.*Tinternal)./(1-K1.^2.*Tinternal.^2);

figure(2)
hold on 
plot(cie.lambda,Tlam(T_internal_Mix1));
plot(cie.lambda,Tlam(T_internal_Mix2));
plot(cie.lambda,Tlam(T_internal_Mix3));
title('Internal Transmission')
xlabel('Wavelength (nm)');
ylabel('Transmission (%)');
legend('70C/30Y','50M/50C','80M/80Y','Location','Best');
axis([380 780 0 1]);
set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
  'LineWidth'   , 1         );
set(gcf, 'PaperPositionMode', 'auto');


%% Question B
load ks_Dpurple_380_780.mat
load ks_Pblue_380_780.mat
load ks_White_k_380_780.mat
white_k_380_780(2,:) = ones(1,81);


K2 = 0.6;
Rlam = @(K,S) 1 + (K./S) - sqrt((K./S).^2 + 2.*(K./S));

Rpurple = Rlam(Dpurple_380_780(1,:),Dpurple_380_780(2,:));
Rblue = Rlam(Pblue_380_780(1,:),Pblue_380_780(2,:));
Rwhite = Rlam(white_k_380_780(1,:),white_k_380_780(2,:));


figure(3)
hold on
plot(cie.lambda, 0.7.*Rpurple + 0.3.*Rwhite);
plot(cie.lambda, 0.5.*Rblue + 0.5.*Rwhite);
plot(cie.lambda, 0.2.*Rpurple + 0.8.*Rwhite);
plot(cie.lambda, 0.2.*Rblue+ 0.8.*Rwhite);
plot(cie.lambda,Rwhite)
hold off
legend('70P/30W','50B/50W','20P/80W','20B/80W','100W','Location','best')
title('Internal Reflectances of Mixtures')
xlabel('Wavelength (nm)');
ylabel('Internal Reflectance (%)');
axis([380 780 0 1]);
set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
  'LineWidth'   , 1         );
set(gcf, 'PaperPositionMode', 'auto');


SPEXm = @(Rlam) ((1-K1).*(1-K2).*Rlam)./(1-K2.*Rlam);
figure(4)
hold on
plot(cie.lambda, SPEXm(0.7.*Rpurple + 0.3.*Rwhite));
plot(cie.lambda, SPEXm(0.5.*Rblue + 0.5.*Rwhite));
plot(cie.lambda, SPEXm(0.2.*Rpurple + 0.8.*Rwhite));
plot(cie.lambda, SPEXm(0.2.*Rblue+ 0.8.*Rwhite));
plot(cie.lambda, SPEXm(Rwhite));
hold off
legend('70P/30W','50B/50W','20P/80W','20B/80W','100W','Location','best')
title('SPEXm of various mixtures');
xlabel('Wavelength (nm)');
ylabel('Internal Reflectance (%)');
axis([380 780 0 1]);
set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
  'LineWidth'   , 1         );
set(gcf, 'PaperPositionMode', 'auto');

figure(5)
plot(cie.lambda,SPEXm(.01.*Rblue + .05.*Rpurple + .94.*Rwhite))
title('SPEXm of 1B/5P/94W');
xlabel('Wavelength (nm)');
ylabel('Internal Reflectance (%)');
axis([380 780 0 1]);
set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
  'LineWidth'   , 1         );
set(gcf, 'PaperPositionMode', 'auto');

