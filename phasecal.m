function [phase] = phasecal(x,y,z)
T=0.5;  %��������
dis=sqrt((x-(-30))^2+(z-30)^2);  %��������
% dis=y;  %��������
% dis=sqrt((x-(-30))^2+(z-30)^2+y^2);  %ʹ��Բ����������ʱ��Ҫ����ڲ����а�`��Ϊy
if x>=-30
    dis=-dis;
end
phase=sin(2*pi*dis/T);
end

