%global settings;

settings.p=.5;                             % input label distribution, probability of 0
settings.p1=.2;                            % error prob of sensor 1
settings.p2=.1;                            % error prob of sensor 2

tot1=0;
tot2=0;
t1=0;

for t=1:1:1000000
    x=(rand < settings.p);
    y1=BSC(x,settings.p1);
    y2=BSC(x,settings.p2);
    tot1=tot1 + xor(y1,y2);
    if x==y1
       t1=t1+1; 
       tot2=tot2+ xor(y2,x);
    end
end

errDiff=tot1/t;
errJoint=tot2/t;
errCond=tot2/t1;

errRate1=settings.p1;
errRate2=settings.p2;

stat=[errRate1 errRate2 errDiff errJoint errCond];

formatSpec = 'Statistic for BSC : is [%4.3f %4.3f %4.3f %4.3f %4.3f] \n';
fprintf(settings.fid, formatSpec, stat);





    
    
    
    
    


