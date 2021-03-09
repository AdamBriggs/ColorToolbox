function out=ref2XYZ(R,Call,I)
%This function converts reflectance factor of a sample
%to Tristimulus Values.
%In order to use you will need not only the reflectance factor
%you wil also need the illuminant and the CMF's for either 2 deg or 10 deg
%observer
%jdk 9/21/11
C=Call(:,2);
k=100./sum(diag(I)*C);
out=k.*Call'*diag(I)*R;
end