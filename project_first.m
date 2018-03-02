a=xlsread('test1.xlsx');

f=readfis('project_redgreenlight.fis');
for i=1:10
        a(i,3)=evalfis([a(i,1) a(i,2)],f);
end
g=readfis('project_nomandriving.fis');
for i=1:270
    a(i,10)=evalfis([(a(i,8)./a(i,6)) a(i,7)/a(i,6)],g).*a(i,9)+a(i,6);
    a(i,11)=evalfis([(a(i,8)./a(i,6)) a(i,7)/a(i,6)],g);
    a(i+1,6)=a(i,10);
    a(i+1,7)=a(i+1,6)-a(i+1,5);
    a(i+1,8)=a(i,8)-a(i,7)*0.1;
    if a(i,8)<0.5
        a(i+1,6)=a(i+1,5);
    end
    if a(i,8)>a(i,6)
        a(i+1,6)=a(i,6)-(a(i+1,7)/8)
    end
    if a(i+1,6)<0
        a(i+1,6)=0;
    end
    
        
     
    a(i,17)=evalfis([(a(i,15)./a(i,13)) a(i,14)/a(i,13)],g).*a(i,16)+a(i,13);
    a(i,11)=evalfis([(a(i,8)./a(i,6)) a(i,7)/a(i,6)],g);
    a(i+1,13)=a(i,17);
    a(i+1,14)=a(i+1,13)-a(i+1,6);
    a(i+1,15)=a(i,15)-a(i,14)*0.1;
    if a(i,15)<0.5
        a(i+1,13)=a(i+1,6);
    end
    if a(i,15)>a(i,13)
        a(i+1,13)=a(i,13)-(a(i+1,14)/8)
    end
    if a(i+1,13)<0
        a(i+1,13)=0;
    end
end
a(1,12)=a(1,8)./a(1,6);
    
xlswrite('testoutput',a);