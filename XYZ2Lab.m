function output=XYZLab(Input1,Input2)
% This function calculates CIELAB values as a 3xn (L;a;b)
% where Input1 is the XYZ of the object, and Input2 is the XYZ of the white
% point (XYZ_n). jdk 10/1/11

ratio=diag(1./Input2)*Input1; % determines XYZ/XYZ_n 
ratio1=power(ratio,.333333);  % f(x) for light colors
ratio2=7.787.*ratio+16/116;   % f(x) for dark colors
idxL=(ratio<=0.008856);  %indexing the value of the ratio for dark colors

ratioCon2X=idxL.*ratio2;  %the LAB value for dark colors
ratioCon1X=~idxL.*ratio1; % the LAB values for light colors (~indexing)

XYZnew3=ratioCon2X+ratioCon1X;  % the LAB values of either dark or light colors

Lstar=116.*XYZnew3(2,:)-16;
astar=500.*XYZnew3(1,:)-500.*XYZnew3(2,:);
bstar=200.*XYZnew3(2,:)-200.*XYZnew3(3,:);

output=cat(1,Lstar,astar,bstar);  % output a 3xn


end
