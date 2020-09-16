S = importdata('Sample_Matrix.dat');
xx = S(:,1);
yy =  S(:,2);
zz = S(:,3);
xy = S(:,4);
yz = S(:,5);
xz = S(:,6);
%Projecting matrix in cartesian coordinates onto unit cell vectors
C = [1 0 0
    0 1 0
    0 0 1]; %unit cell vectors
s=[];
%matrix * vectors
for i=1:size(xx,1)
matric = [xx(i,:) xy(i,:) xz(i,:);xy(i,:) yy(i,:) yz(i,:);xz(i,:) yz(i,:) zz(i,:)];
%Matrix along a vector
m1 = matric*C(1,:)'/norm(C(1,:));
a=sqrt(m1(1)^2+m1(2)^2+m1(3)^2); %Absolute values
%Matrix along b vector
m2 = matric*C(2,:)'/norm(C(2,:));
b=sqrt(m2(1)^2+m2(2)^2+m2(3)^2);
%Matrix along c vector
m3 = matric*C(3,:)'/norm(C(3,:));
c=sqrt(m3(1)^2+m3(2)^2+m3(3)^2);
m=[a b c];
s=[s;m]; %Matrix along a b c vectors
end
