function [SOLUCAO,custo,GRAFO_En]=FUNCAO_CUSTO(N,X,cabos)

    %% ST-> List of undirected edges of the Tree with Root at the Substation
    %% Arv-> Geographic coordinates of the vertex vs and vt of N
    %% cabos-> List of available childhood verbs
    %% ST-> subset of N ; 
    %% Arv-> subset of X; 
    
    tN=size(N);tN=tN(1);
    GRAFO=zeros(tN+1,tN+2);
    GRAFO_En=zeros(tN+1,tN+1);
    custo=0;
    tCab=size(cabos);tCab=tCab(1);
    
    SOLUCAO=zeros(tN,4);
    SOLUCAO=[N SOLUCAO];    
    
    
            i=1;
            while(i<=tN)          
            
            GRAFO_En(N(i,1),N(i,2))=N(i,3);
            GRAFO_En(N(i,2),N(i,1))=N(i,3);
    
            Xvsi=X(N(i,1),1); 
            Yvsi=X(N(i,1),2);
    
            Xvti=X(N(i,2),1);
            Yvti=X(N(i,2),2);
    
            P1=[Xvsi Yvsi];
            P2=[Xvti Yvti];           
            Px=(P2(1)-P1(1))^2;
            Py= (P2(2)-P1(2))^2 ;
            d=sqrt(Px+Py);     
            SOLUCAO(i,4)=d;            
    
            j=1;
            SOLUCAO(i,5)=SOLUCAO(i,4)*cabos(j,2);
            SOLUCAO(i,6)=j;
            while(j<=tCab)
    
                if (cabos(j,1)>=SOLUCAO(i,3)) 
                             
                    SOLUCAO(i,6)=j;
                    SOLUCAO(i,5)=SOLUCAO(i,4)*cabos(SOLUCAO(i,6),2);
                    SOLUCAO(i,7)=cabos(j,1)-SOLUCAO(i,3); 
                    j=tCab+1;
                end
                
            j=j+1;
            end
            i=i+1;    
            end
                
    custo=sum(SOLUCAO(:,5));
end

