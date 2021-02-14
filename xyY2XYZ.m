function [XYZ] = xyY2XYZ(xyY)
%% Adam Briggs
% 14 February 2021
% Input xy chromaticity coordinates and output tristimulus values
% MUST INPUT XYZ AS 3X1 MATRIX
X = (xyY(1,:)/xyY(2,:))*xyY(3,:);
Y = xyY(3,:);
Z = (1-xyY(1,:)-xyY(2,:))/(xyY(2,:))*xyY(3,:);
[XYZ] = [X;Y;Z];
end