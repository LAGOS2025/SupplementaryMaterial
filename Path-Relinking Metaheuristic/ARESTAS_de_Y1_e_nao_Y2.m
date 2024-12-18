function [A]=ARESTAS_de_Y1_e_nao_Y2(Y1,Y2)
    n=size(Y1.N);n=n(1);
    A=[];i=1;
    while(i<=n)
        A1=Y1.N(i,1:2);
        j=1;sinal=0;
        while(j<=n)
            A2=Y2.N(j,1:2);
            if ((A1(1)==A2(1))&(A1(2)==A2(2)))
                sinal=1;
            end
        j=j+1;
        end
        if(sinal==0)
            A=[A;A1];
        end
    i=i+1;
    end
end