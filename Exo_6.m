clear variables;close all;hold on;
TO=[];
Ein=imread('einstein.jpg');
%imshow(Ein)
E=double(Ein);
E=E(:,:,1);
K=[5,40,100,200];

A=diag([3 3 3],1)+diag([1 2 3 4])+diag([-2 -2 -2],-1);
B=2*ones(3,4);
M=[A;B];

%[U,S,V]=svd(M);
[U,S,V]=svd(E);

%r=rank(M);
re=rank(E);



for i=1:length(K);
   
    Ak=0;
    G=[];
    to=0;
    
    for j= 1:K(i);
        Ak=Ak+S(j,j)*U(:,j)*V(:,j)';
    end
    figure(1);subplot(2,2,i);
    EE=uint8(Ak);
    imshow(EE)
    
    for h=1:K(i);
        G=[G,S(h,h)];
    end
     figure(2);subplot(2,2,i);plot(G);
     
     to=1-K(i)*((length(Ak(:,1))+length(Ak(1,:)))/(length(Ak(:,1))*length(Ak(1,:))));
     TO=[TO,to];
end
figure(3);plot(K,TO,'*-');


