% Adam Briggs
% OPT222 HW5

%% Q1
load SkyBlue
load cie
SkyBlueInterp = interp1(SkyBlue(:,1),SkyBlue(:,2),(380:5:780)');
SkyBlueInternp(:,2) = SkyBlueInterp(:,1);
SkyBlueInterp(:,2) = SkyBlueInterp(:,1);
SkyBlueInterp(:,1) = (380:5:780)';

%% Q2
%Create XYZ arrays of various illuminants
d65XYZ = ref2XYZ(ones(81,1),cie.cmf2deg,cie.illD65);
aXYZ = ref2XYZ(ones(81,1),cie.cmf2deg,cie.illA);
F2XYZ = ref2XYZ(ones(81,1),cie.cmf2deg,cie.illF(:,2));
blueXYZ = ref2XYZ(SkyBlueInterp(:,2),cie.cmf2deg,cie.illD65);

AtoD65_XYZ = XYZ_VK_XYZ(blueXYZ,aXYZ,d65XYZ);
F2toD65_XYZ = XYZ_VK_XYZ(blueXYZ,F2XYZ,d65XYZ);

%% Q3
A_D65_Lab = XYZ2Lab(AtoD65_XYZ,d65XYZ);
F2_D65_Lab = XYZ2Lab(F2toD65_XYZ,d65XYZ);
blueLAB = XYZ2Lab(blueXYZ,d65XYZ); 

figure(1)
hold on
plot(A_D65_Lab(2),A_D65_Lab(3),'d');
plot(F2_D65_Lab(2),F2_D65_Lab(3),'d');
plot(blueLAB(2),blueLAB(3),'d');
hold off
legend('A','F2','Blue')
xlabel('a^*')
ylabel('b^*')

%% Q4
diff_A_D65 = deltaE94(A_D65_Lab,blueLAB);
diff_F2_D65 = deltaE94(F2_D65_Lab,blueLAB);

disp(['The DE94 color difference between the illuminant A blue and' ...
    'the original D65 blue is: ',num2str(diff_A_D65)]);

disp(['The DE94 color difference between the illuminant F2 blue and' ...
    'the original D65 blue is: ',num2str(diff_F2_D65)]);

disp(['If these are >3, there is a just noticable color difference.'])

% This painting will not maintain its blue sky appearance under either of
% the two other illuminants. This is because the color difference is > 3
% meaning there will be a noticable color difference. 

