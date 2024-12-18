function [S]=Ordena_Vertice_TPGi_OPERADOR_VELOCIDADE(S)




tTurbTpg=size(S.Turb_TPG);tTurbTpg=tTurbTpg(2);
i=1;N=[];
while(i<=tTurbTpg)


[a,b]=find(S.Ver_TPGi(:,2)==i);
verTPGi=S.Ver_TPGi(a,1);verTPGi=verTPGi';
[a,b]=find(S.N(:,1)==verTPGi);
N=[N;S.N(a,:)];
i=i+1;
end

S.N=N;

end