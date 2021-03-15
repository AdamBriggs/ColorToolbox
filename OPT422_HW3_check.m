% HW#3 Data
% JDK 2/11/18

%load samples and names
ref=load('ColorChecker_380-780-5nm.txt');
ref=ref(:,2:end);
names=textread('ColorChecker_names.txt','%s','delimiter','|');

%compute XYZ and CIELAB values for samples
load cie
XYZn=ref2XYZ(ones(length(cie.lambda),1),cie.cmf2deg,cie.illD65);
XYZ=ref2XYZ(ref,cie.cmf2deg,cie.illD65);
Lab=XYZ2Lab(XYZ,XYZn);

%Display Results
fprintf('Results for CIE IllD65 and 2deg Observer\n');
fprintf(' #    X      Y       Z       L*      a*      b*    Name\n');
for ii=1:size(Lab,2)
   fprintf('%2d %7.3f %7.3f %7.3f %7.3f %7.3f %7.3f %s\n',ii,XYZ(:,ii),Lab(:,ii),names{ii});
end


XYZDark=ref2XYZ(ref.*0.02,cie.cmf2deg,cie.illD65);
LabDark=XYZ2Lab(XYZDark,XYZn);

%Display Results
fprintf('Results for CIE IllD65 and 2Deg Observer Dark Colors\n');
fprintf(' #    X      Y       Z       L*      a*      b*    Name\n');
for ii=1:size(LabDark,2)
   fprintf('%2d %7.3f %7.3f %7.3f %7.3f %7.3f %7.3f %s\n',ii,XYZDark(:,ii),LabDark(:,ii),names{ii});
end

