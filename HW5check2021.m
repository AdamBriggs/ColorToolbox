% check for HW#5 in OPT 222/422
% clear all
% close all
% clc

% load LtGreenYellow
LtGY=LtGreenYellow./100;
load cie

XYZ_colorA=ref2XYZ(LtGY,cie.cmf2deg,cie.illA);
XYZ_A=whitepoint('a')'.*100;
XYZ_D65=whitepoint('d65')'.*100;

XYZ_colorVKD65=XYZ_VK_XYZ(XYZ_colorA,XYZ_A,XYZ_D65)


% answer should be approx. [25.3238; 46.3575; 19.3310]