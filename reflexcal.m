function [xcoutput,ycoutput,zcoutput,io] = reflexcal(xcoinput,ycoinput,T,A)
delta=0.0055*xcoinput-0.00275;
ycorel=0.0055*ycoinput-0.00275+(-8.8);
zcorel=(30*sqrt(2)+35.442283)*sqrt(0.5)+6.6*sqrt(0.5)-delta*sqrt(0.5);
xcorel=(30*sqrt(2)+35.442283)*sqrt(0.5)-6.6*sqrt(0.5)+delta*sqrt(0.5);  %����ռ�����

m1=xcorel-30;
n1=ycorel-0;
p1=zcorel-30;
syms x y z
[x1,y1,z1]=vpasolve([(x-30)/m1==y/n1,(x-30)/m1==(z-30)/p1,z==A*sin(2*pi*x/T)],[x,y,z]);  %���㽻������
% [x1,y1,z1]=vpasolve([(x-30)/m1==y/n1,(x-30)/m1==(z-30)/p1,z-1==A*sin(2*pi*x/T)],[x,y,z]);  %z����ƽ��
% T1=0.1;
% A1=0.0005;
% [x1,y1,z1]=vpasolve([(x-30)/m1==y/n1,(x-30)/m1==(z-30)/p1,z==A*sin(2*pi*x/T)+A1*sin(2*pi*x/T1)],[x,y,z]);  %���������

m2=-2*pi/T*A*cos(2*pi*x1/T);
% m2=-2*pi/T*A*cos(2*pi*x1/T)+tan(5/180*pi);  %y������ת5�ȣ�x��������
n2=0;
p2=1;
% [theta,rho]=cart2pol(m2,n2);
% theta=(theta/pi*180+5)/180*pi;
% [m2,n2]=pol2cart(theta,rho);  %��z����ת
vecref=[m1,n1,p1];  %��������
vecnor=[m2,n2,p2];  %���淨����
syms m n p
[m3,n3,p3]=vpasolve([m2*m+n2*n+p2*p==dot(vecref,vecnor),dot([m,n,p],cross(vecref,vecnor))==0,norm([m,n,p])==norm(vecref)],[m,n,p]);  %������������

[x2,y2,z2]=vpasolve([(x-x1)/m3==(y-y1)/n3,(x-x1)/m3==(z-z1)/p3,-x+z==60],[x,y,z]);  %�������Ļ�Ľ���
xcoutput = x2;
ycoutput = y2;
zcoutput = z2;
if abs(x1)<=5&&abs(y1)<=5&&z2>=0  %�ж��Ƿ񳬳���Χ
    io=1;
else
    io=0;
end
end
