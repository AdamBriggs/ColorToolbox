function [ output_args ] = xyY2UCS( xy )
%This function simply changes x,y,Y Chromaticitiy coordinates
%to u', v' coordinates in the Uniform Color Scales.
%If there is only x and y and no Y, this function sets Y=1;
% jdk 9/1/18

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

u_prime= (4.*X)./(X+15.*Y+3.*Z);
v_prime= (9.*Y)./(X+15.*Y+3.*Z);

output_args=[u_prime;v_prime;Y];


end

