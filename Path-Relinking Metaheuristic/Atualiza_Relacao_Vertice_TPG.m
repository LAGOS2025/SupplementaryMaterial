function [S]=Atualiza_Relacao_Vertice_TPG(S)
    S.Turb_TPG=[];
    %% Search for quantity of TPGi (Connections to Substation)
    I=find(S.N(:,2)==1);tI=size(I);tI=tI(1);
    S.q_LigS=tI;
    i=1;    
    while(i<=tI)
        F=[S.N(I(i),1)];
        j=1;tF=size(F);tF=tF(1);        
            while (j<=tF)
                IF=find(S.N(:,2)==F(j));       
                F=[F S.N(IF(:),1)'];
                tF=size(F);tF=tF(2);
            j=j+1;
            end
        S.Turb_TPG=[S.Turb_TPG [i;tF]];
        S.Ver_TPGi(F',2)=i;
        i=i+1;
    end
    
end