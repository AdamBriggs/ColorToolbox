function DE94 = deltaE94(LabTest, LabStandard, varargin)
% Calculates Delta E^94 Color difference metric
kl = 1;
kc = 1;
kh = 1;

a_test = LabTest(2,:);
b_test = LabTest(3,:);

a_standard = LabStandard(2,:);
b_standard = LabStandard(3,:);

cab = @(x) sqrt(x(2,:).^2+x(3,:).^2);

C_starB = cab(LabTest);
C_starS = cab(LabStandard);

delL = LabTest(1,:) - LabStandard(1,:);
delC = C_starB - C_starS;

delH = (a_test.*b_standard - a_standard.*b_test)./ ...
    sqrt(0.5.* (C_starB.*C_starS + a_test.*a_standard+ b_test.*b_standard));
    
if any(strcmp(varargin, 'geometric mean'))
        C_star=(C_starS.*C_starB).^(0.5);
        disp('TESTING');
    else
        C_star = C_starS;
end
SL = 1;
SC = 1 + 0.045.*C_star;
SH = 1 + 0.015.*C_star;

DE94 = sqrt((delL./(kl.*SL)).^2+(delC./(kc.*SC)).^2+(delH./(kh.*SH)).^2);

end


