function [ output_args ] = XYZ2UCS( XYZ )
%This function simply changes XYZ Tristimulus Values
%to u', v' coordinates in the Uniform Color Scales.

X=XYZ(1,:);
Y=XYZ(2,:);
Z=XYZ(3,:);

u_prime=(4.*X)./(X+15.*Y+3.*Z);

v_prime=(9.*Y)./(X+15.*Y+3.*Z);

output_args=[u_prime;v_prime;Y];


end

A