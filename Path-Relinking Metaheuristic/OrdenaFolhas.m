function [A] = OrdenaFolhas(A,Y)
    tA=size(A);tA=tA(1);
    nAi=[];nAf=[];
    for(i=1:tA)
        [a,b]=find(Y.N(:,2)==A(i,1));    
        a=size(a);
        
        if(a(1)==0)
            nAi=[nAi;A(i,:)];
        else
            nAf=[nAf;A(i,:)];
        end
    end
    A=[nAi;nAf];
end