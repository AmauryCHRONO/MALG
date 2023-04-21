clear variables;close all;hold on;

M=100;

figure(1);   
a=2;b=-5;c=1; 
x2=-3:0.1:3; 
y2=-2.5:0.1:4; 
z2=-8:1:8; 
[X2,Y2]=meshgrid(x2,y2); 
Z2=-(a*X2+b*Y2)/c; 
C(:,:,1)=zeros(size(Z2));     % red 
C(:,:,2)=0.8*ones(size(Z2));  % green 
C(:,:,3)=0.8*ones(size(Z2));  % blue 
mesh(X2,Y2,Z2,C);

n=10;
X=-2+(2+2)*rand(1,n);
Y=-2+(2+2)*rand(1,n);
Z=-8+(6+8)*rand(1,n);
figure(1);plot3(X,Y,Z,'.b');axis equal;
 axis([-3,3,-3,3,-8,8]);
N=[a;b;c];
N=N/norm(N);
P=diag([1 1 1])-N*N';
U=[X;Y;Z];
for k= 1:n;
    V(:,k)=P*U(:,k);
end
plot3(V(1,:),V(2,:),V(3,:),'.r')
for k=1:n
    plot3([U(1,k),V(1,k)],[U(2,k),V(2,k)],[U(3,k),V(3,k)],'k')
end

ANG=[];
delta=0:0.01:5;
for k=1:length(delta);
    
    d=-delta(k)/2+delta(k)*rand(3,n);
    R=V+d;
    plot3(R(1,:),R(2,:),R(3,:),'*')
    A=[R(1,:) ; R(2,:)]';
    v=R(3,:)';
    u= inv(A'*A)*A'*v;
    a1=u(1);b1=u(2);c1=-1;
    N2=[a1;b1;c1];
    N2=N2/norm(N2);

    alpha=acos(N'*N2);
    if alpha>pi/2;
        alpha=pi-alpha;
    end
    alpha=alpha*180/pi
    ANG=[ANG,alpha];
    
end

figure(2);plot(ANG);
