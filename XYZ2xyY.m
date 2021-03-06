function [xyY] = XYZ2xyY(XYZ)
%% Adam Briggs
% 14 February 2021
% Input tristimulus values and output xy chromaticity coordinates
% MUST INPUT XYZ AS 3X1 MATRIX
x = XYZ(1,:)./sum(XYZ); %x = X/(X+Y+Z)
y = XYZ(2,:)./sum(XYZ); %y = Y/(X+Y+Z)
Y = XYZ(2,:); %Y is just the Y tristimulus
[xyY] =[x;y;Y]; %Outputs in correct vector format
end
