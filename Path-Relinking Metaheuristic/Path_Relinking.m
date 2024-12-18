function [Yotm] = Path_Relinking(Y1,Y2,fig)
%% Find the best solution between target and current
Ys=Y1;Yt=Y2;YP=[Yt.custo];    EixoX=[1];ix=1;
if(Y2.custo<=Y1.custo)
    Yotm=Y2;    
else
    Yotm=Y1;
end    
    %% Edges of Y1 (target) that are not in Y2 (current solution)
    [A]=ARESTAS_de_Y1_e_nao_Y2(Y1,Y2);
    %% Sort leaf vertices to the root
    [A] = OrdenaFolhas(A,Y2);    
    %% Assign Edge i of Y1 to Y2
    i=1;tA=size(A);tA=tA(1);
    while(i<=tA)
        %%  Search source edge of Y2 equal to source edge Y1
        vAs=A(i,1);
        I=find(Y2.N(:,1)==vAs);
        %% Replaces edges
        Y2.N(I,1)=A(i,1);
        Y2.N(I,2)=A(i,2);
        %% Updates the number of connections to the Substation
        qS=find(Y2.N(:,2)==1);qS=size(qS);qS=qS(1);
        Y2.q_LigS=qS;
        %% Check Viability 
        [sinal,Y2]=VERIFICAR_VIABILIDADE_SOLUCAO(Y2);
        %% Update solution in case of confirmed viability
        if (sinal==0)
            %% Update which TPG each vertex belongs to
            [Y2]=Atualiza_Relacao_Vertice_TPG(Y2);
            %% Calculate Solution Cost
            [SOLUCAO,custo,GRAFO_En]=FUNCAO_CUSTO(Y2.N,Y2.X,Y2.cabos);
            Y2.S=SOLUCAO;
            Y2.Gen=GRAFO_En;
            Y2.custo=custo;
            %% Stores best current solution
            if (Y2.custo<Yotm.custo)     
                Yotm=Y2;
            end
            YP=[YP Y2.custo];
            %% Generate Figure for viewing
            Imprime_Solucao(Y2,Ys,YP)
            %% Delay
            pause(1)
%           pause               
        else
            tV=size(Y2.N);tV=tV(1);       
        end         
    i=i+1;
    end
end