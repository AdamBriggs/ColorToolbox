function [ output_args ] = xyY2XYZ( xy )
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

X=(x./y).*Y;

Z=((1-x-y)./y).*Y;

output_args=[X;Y;Z];


end

