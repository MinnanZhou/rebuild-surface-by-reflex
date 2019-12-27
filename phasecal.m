function [phase] = phasecal(x,y,z)
T=0.5;  %条纹周期
dis=sqrt((x-(-30))^2+(z-30)^2);  %横向条纹
% dis=y;  %纵向条纹
% dis=sqrt((x-(-30))^2+(z-30)^2+y^2);  %使用圆形正弦条纹时需要在入口参数中把`改为y
if x>=-30
    dis=-dis;
end
phase=sin(2*pi*dis/T);
end

