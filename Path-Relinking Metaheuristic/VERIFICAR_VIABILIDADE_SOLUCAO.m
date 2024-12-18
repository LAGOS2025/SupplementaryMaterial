function [sinal,S]=VERIFICAR_VIABILIDADE_SOLUCAO(S)
    sinal=0;
    %% Performs Breadth-First Search to see if it is Connected
    n=size(S.X);n=n(1);
    s=[S.N(:,1)'];t=[S.N(:,2)'];
    g=digraph(t,s);
    v = bfsearch(g,1);    
    if (size(v)<n)
        sinal=1;
    end
    %% Check for edge crossings (cables)
    i=1;
    while(i<n)
    A1=S.N(i,1:2);
        j=i+1;
        while(j<n)
            A2=S.N(j,1:2);
            V1s=A1(1);V1t=A1(2);
            V2s=A2(1);V2t=A2(2);
            R1=[S.X(V1s,1) S.X(V1s,2);S.X(V1t,1) S.X(V1t,2)];
            R2=[S.X(V2s,1) S.X(V2s,2);S.X(V2t,1) S.X(V2t,2)];
            
            if (V1s==V2s|V1s==V2t)  
                sinal=0;        
            elseif (V1t==V2s|V1t==V2t)  
                sinal=0;
            else
                sinal=CruzamentoComputacional(R1,R2);
            end

            if (sinal==1)
                j=n+1;i=n+1;
            end
    
            j=j+1;
        end
    
    i=i+1;    
    end
    
    %% Check Substation Connection Quantity    
    qS=find(S.N(:,2)==1);qS=size(qS);qS=qS(1);
    if (qS>S.l_LigS)
        sinal=1;
    end    
    %% Check cycles
    g=graph(s,t);
    ciclo= allcycles(g);
    
    tC=size(ciclo);
    if (tC(1)>0)
        sinal=1;
    end    
    %% Check Power Limit for Each Cable Cables
    GRAFO=zeros(n,n);
    g=digraph(s,t);
    i=2;
    while (i<=n)
    
     P = shortestpath(g,i,1);
     tP=size(P);tP=tP(2);
    
         j=1;
         while (j<tP)
         GRAFO(P(j),P(j+1))=GRAFO(P(j),P(j+1))+1; 
         if (max(S.cabos(:,1))<GRAFO(P(j),P(j+1)))      
             sinal=1;
             j=tP;i=n+1;
         end
         j=j+1;    
         end
    
    i=i+1;
    end
    
    i=1;
    while (i<=n-1)
        S.N(i,3)=GRAFO(S.N(i,1),S.N(i,2));
    i=i+1;
    end
    
end