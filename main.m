l=0;
CCD=cell(1,11);
for k=[+Inf,40,30,20,10,5,4,3,2,1,0.5]  %包含所有需要计算的周期 +Inf对应于理想平面的反射情况
    l=l+1;
    screen=zeros(2400,3200);
    parfor i=1:2400
        [x,y,z,io]=reflexcal(i,1600,k,0.005);
        if io==1
            phase=phasecal(x,y,z);
            screen(i,1600)=double(phase);
        else
            screen(i,1600)=-1;
        end
    end
    
    for j=842:2359
        screen(:,j)=screen(:,1600);
    end
    for j=1:841
        screen(:,j)=-1;
    end
    for j=2360:3200
        screen(:,j)=-1;
    end
    CCD{l}=screen;  %通过前面的计算确定合适的y边界
    
end
