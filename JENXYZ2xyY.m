function output=XYZ2xyY(input)
%This function converts Tristimulus Values to 1931 CIE Chromaticity
%Coordinates.
%One can input a 3xn array of data for the conversion
%jdk 9/21/11
Denom=input(1,:)+input(2,:)+input(3,:);
x=input(1,:)./Denom;
y=input(2,:)./Denom;
Y=input(2,:);
output=[x; y; Y];

end

