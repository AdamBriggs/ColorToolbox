function [ output_args ] = XYZ2Lab(XYZ, XYZn)
%% Adam Briggs
% Input xy chromaticity coordinates and output tristimulus values
% MUST INPUT XYZ AS 3X1 MATRIX

    function [output] = f(ratio)
        if ratio > 0.008856
            output = ratio.^(1/3);
        else
            output = (7.787.*ratio+16)./116;
        end
    end

X = XYZ(1,:);
Y = XYZ(2,:);
Z = XYZ(3,:);

Xn = XYZn(1,:);
Yn = XYZn(2,:);
Zn = XYZn(3,:);

L = 116.*f(Y./Yn)-16;
a = 500.*(f(X./Xn)-f(Y./Yn));
b = 200.*(f(Y./Yn)-f(Z./Zn));
output_args=[L;a;b];
end

