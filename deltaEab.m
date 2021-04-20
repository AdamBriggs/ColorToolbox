function output=deltaEab(Batch,Standard)
%This function converts two CIELab values to 
%Delta E*ab color difference. 
DeltaLstar=Batch(1,:)-Standard(1,:);
Deltaastar=Batch(2,:)-Standard(2,:);
Deltabstar=Batch(3,:)-Standard(3,:);
Eestar=power(DeltaLstar,2)+power(Deltaastar,2)+power(Deltabstar,2);
output=power(Eestar,0.5);
end

