clear all
close all
clc

cc = load('ColorChecker_380-780-5nm.txt');
cc = cc(:,2:end);

meta = load('MetaChecker_380-780-5nm.txt');
meta = meta(:,2:end);

load cie
XYZnA = ref2XYZ(ones(length(cie.lambda),1),cie.cmf2deg,cie.illA);
XYZnD65 = ref2XYZ(ones(length(cie.lambda),1),cie.cmf2deg,cie.illD65);
cc_LabA = XYZ2Lab(ref2XYZ(cc,cie.cmf2deg,cie.illA),XYZnA);
meta_LabA = XYZ2Lab(ref2XYZ(meta,cie.cmf2deg,cie.illA),XYZnA);
cc_LabD65 = XYZ2Lab(ref2XYZ(cc,cie.cmf2deg,cie.illD65),XYZnD65);
meta_LabD65 = XYZ2Lab(ref2XYZ(meta,cie.cmf2deg,cie.illD65),XYZnD65);

DEab_illD65 = deltaEab(meta_LabD65,cc_LabD65);
DEab_illA = deltaEab(cc_LabA,meta_LabA);

format short g
[[1:24]',DEab_illD65',DEab_illA']