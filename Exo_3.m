clear variables;close all;

n=10;
A=zeros(n,n);
b=[-1 2 -1]';
A([1,2],1)=b([2,3],1);
A([n-1,n],n)=b([1,2],1);
for k= 2:n-1;
    A(k-1:k+1,k)=b;
end 
A
eps=0.0000001;
ValP=zeros(n,n);
VectP=zeros(n,n);

B=A;
for k=1:n;
    cpt=0;
    delta=1;
    lambda_tab=[];
    lambda0=1;
    e0=rand(n,1);
    e0=e0/norm(e0);
    while delta>eps;
        e1=B*e0;
        lambda=norm(e1)/norm(e0);
        delta=abs(lambda0-lambda);
        e1=e1/norm(e1);
        lambda0=lambda;
        e0=e1;
        lambda_tab=[lambda_tab,lambda];
        cpt=cpt+1;
    end
    B=B-(lambda0/(e0'*e0))*e0*e0';
    ValP(k,k)=lambda0;
    VectP(:,k)=e0;
    
end
D=ValP
P=VectP
AA=P*D*inv(P)
dif=(1-norm(A-AA)/norm(A))*100
    
