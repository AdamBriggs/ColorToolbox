function XYZ = XYZ_VK_XYZ(XYZcolor, XYZill, XYZd65)
Mcat02 = [.7328 .4296 -.1624;-.7036 1.6975 .0061; .003 .0136 .9834];
RGBofXYZill = Mcat02*XYZill;
RGBofXYZd65 = Mcat02*XYZd65;

illuminantratio = RGBofXYZd65./RGBofXYZill;
Mvk = diag(illuminantratio);

XYZ = inv(Mcat02)*Mvk*Mcat02*XYZcolor;
end