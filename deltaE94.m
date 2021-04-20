function output = deltaE94( CIELabVB,CIELabVS,varargin)
%This function will implement the DE*94 color difference equation.
% Input is two CIELab 3xn matrices (one batch & one standard) and the output will be a 1xn matrix of
% DE values.
DeltaL=CIELabVB(1,:)-CIELabVS(1,:);
astarBSQ=power(CIELabVB(2,:),2); %batch
astarSSQ=power(CIELabVS(2,:),2); %batch
bstarBSQ=power(CIELabVB(3,:),2); %standard
bstarSSQ=power(CIELabVS(3,:),2); %standard
CstarB=power(astarBSQ+bstarBSQ,1/2); %batch
CstarS=power(astarSSQ+bstarSSQ,1/2); %standard
DeltaC=CstarB-CstarS;
DeltaHNum=(CIELabVS(2,:).*CIELabVB(3,:))-(CIELabVB(2,:).*CIELabVS(3,:));
DeltaHDen=power(0.5.*(CstarS.*CstarB+CIELabVB(2,:).*CIELabVS(2,:)+CIELabVB(3,:).*CIELabVS(3,:)), 1/2);
DeltaH=DeltaHNum./DeltaHDen;

if any(strcmp(varargin,'geometric mean'));
    CstarS1=power((CstarS.*CstarB),1/2);
else
    CstarS1=CstarS;
end

SL=1;
SC=1+0.045.*CstarS1;
SH=1+0.015.*CstarS1;
kL=1;kC=1;kH=1;
DLSQ=power(DeltaL./(kL.*SL),2);
DCSQ=power(DeltaC./(kC.*SC),2);
DHSQ=power(DeltaH./(kH.*SH),2);
DE94=power(DLSQ+DCSQ+DHSQ,1/2);
output=DE94;


end

