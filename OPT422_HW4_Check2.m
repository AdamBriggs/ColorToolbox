clear all
close all
clc

cc = load('ColorChecker_380-780-5nm.txt');
cc = cc(:,2:end);

meta = load('MetaChecker_380-780-5nm.txt');
meta = meta(:,2:end);

load cie
XYZn = ref2XYZ(ones(length(cie.lambda),1),cie.cmf2deg,cie.illA);
cc_Lab = XYZ2Lab(ref2XYZ(cc,cie.cmf2deg,cie.illA),XYZn);
meta_Lab = XYZ2Lab(ref2XYZ(meta,cie.cmf2deg,cie.illA),XYZn);

DE94_cc = deltaE94(meta_Lab,cc_Lab)
DE94_meta = deltaE94(cc_Lab,meta_Lab);
DE94_geometric = deltaE94(cc_Lab,meta_Lab,'geometric mean');

format short g
[[1:24];DE94_cc ; DE94_meta ; (DE94_cc+DE94_meta)./2 ; DE94_geometric]'