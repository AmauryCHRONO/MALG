clear variables;close all;hold on;

% motif de base 
F0=2*[-0.5,-0.5,-5,-3,-10,-8,-9,-6,-6,-2,-5,-2,0,2,5,2,6,6,9,8,10,3,5,0.5,0.5;  % abscisses 
       0,10,9,12,17,17,20,20,22,17,27,25,30,25,27,17,22,20,20,17,17,12,9,10,0]; % ordonnées   
[m,n]=size(F0); 
  
% dimension du cadre d'affichage 
L=200;  
cadre=[-L,L,-L,L]; 
  
% affichage du motif de base 
color=[0,0,0]; 
fill(F0(1,:),F0(2,:),color); 
axis('equal'); 
axis(cadre);

question=3; 
switch question
    case 1
        u=[-80;60];
        F1=F0+u*ones(1,25);
        fill(F1(1,:),F1(2,:),[1,0,0]);
        axis equal
        
        n=[sqrt(2)/2;sqrt(2)/2];
        S=2*n*n'-diag([1 1]);
        F2=S*F1;
        fill(F2(1,:),F2(2,:),[0,1,0]);
        
        x=[-L,L];
        y=x;
        plot(x,y,'g--')
        
        R=[cos(-2*pi/3) -sin(-2*pi/3);sin(-2*pi/3) cos(-2*pi/3)];
        F3=R*F2;
        fill(F3(1,:),F3(2,:),[0,0,1]);
        
        r=norm(mean(F2'));
        
        t = 0:pi/50:2*pi;
        x1 = r * cos(t);
        y1 = r * sin(t);
        plot(x1,y1,'b--')
    case 2
        
        u=[-80;60];
        F1=F0+u*ones(1,25);
        fill(F1(1,:),F1(2,:),[1,0,0]);
        axis equal
        N=30;
        for k=1:N;
            
            n=[-1+2*rand;-1+2*rand];
            n=n/norm(n);
            S=2*n*n'-diag([1 1]);
            F2=S*F1;
            fill(F2(1,:),F2(2,:),[rand,rand,rand]);
        end
          
    case 3
        N=1000;
        u=[-80;60];
        L=200;
        F1=F0+u*ones(1,25);
        fill(F1(1,:),F1(2,:),[1,0,0]);
        axis equal
        for k=1:N;
            H=[-L+2*L*rand;-L+2*L*rand];
            ang=2*pi*rand;
            R=[cos(ang) -sin(ang);sin(ang) cos(ang)];
            F3=R*F1+H*ones(1,25);
            fill(F3(1,:),F3(2,:),[rand,rand,0]);
        end
            
            
   

end