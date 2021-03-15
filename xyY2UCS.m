function [ output_args ] = xyY2UCS( xy )
%% Adam Briggs
% 14 February 2021
% Input xy chromaticity coordinates and output tristimulus values
% MUST INPUT XYZ AS 3X1 MATRIX
%This function simply changes x,y,Y Chromaticitiy coordinates
%to tristimulus values.  If there is only x and y and no Y
% this function sets Y=1;
[v,w]=size(xy);
if v==3 %checks to see if there is an x,y, and Y
    x=xy(1,:);
    y=xy(2,:);
    Y=xy(3,:);
else
    x=xy(1,:);
    y=xy(2,:);
    Y=ones(1,w); 
end

u = (4.*x)./(-2.*x-12.*y+3);
v = (9.*x)./(-2.*x+12.*y+3);
output_args=[u;v];
end

