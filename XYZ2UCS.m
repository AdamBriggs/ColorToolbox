function [UCS] = XYZ2UCS(XYZ)
%% Adam Briggs
% 15 March 2021
% Input tristimulus values and output xy chromaticity coordinates
% MUST INPUT XYZ AS 3X1 MATRIX
X = XYZ(1,:);
Y = XYZ(2,:);
Z = XYZ(3,:);

u = (4.*X)./(X+15.*Y+3.*Z);
v = (9.*Y)./(X+15.*Y+3.*Z);

[UCS] =[u;v]; %Outputs in correct vector format
end
