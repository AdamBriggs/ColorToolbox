function [DEab] = deltaEab(LabB, LabS)
% Color Difference using Delta E^*ab formula

difference = LabB-LabS;

DEab = sqrt((difference(1,:)).^2+(difference(2,:)).^2+(difference(3,:)).^2);

end