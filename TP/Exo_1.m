clear variables;close all;

A=[1 -2 3 1 ; 2 5 -1 3 ; 4 1 0 2 ; 0 -2 3 1];

A(:,3);

A(4,:);

A(:,3)=[1,1,1,1];

D=det(A);

T=trace(A);

b=[1 ; 2 ; -1 ; 3];

x1=A\b;%mieux
x2=inv(A)*b;%pas bien

B=A(:,2:3);

C=A([1,3],:);

D=A(2:4,2:4);

M=C*C'

[P,D]=eig(M)

P*P'
    




