function [XYZ] = ref2XYZ(reftrans, CMF, illSPD)
%% Adam Briggs
% 14 February 2021
% Input reflectance vector, CIE CMF, and spectral power distribution
k = 100 ./ (CMF(:,2)'*illSPD); %Calculate scalar illumunation norm constant
XYZ = k.* CMF'*diag(illSPD)*reftrans; % [1x1][3x81][81x81][81x3] Calc Tristimulus values
end