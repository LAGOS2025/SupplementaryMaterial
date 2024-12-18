function []=Imprime_Solucao(Yt,Yi,YP)


hold on

N2=Yt.N;
X2=Yt.X;
C2=Yt.S(:,6);


N3=Yi.N;
X3=Yi.X;
C3=Yi.S(:,6);



g2 = digraph(N2(:,1),N2(:,2));
subplot(2,2,1)
h2=plot(g2, 'XData', X2(:,1), 'YData', X2(:,2));
set(gcf, 'WindowState', 'maximized'); 

title('Current Solution', 'FontSize', 18);


%% axis off
n=size(N2);n=n(1);
for(i=1:n)
        
    if(C2(i)==1)
        highlight(h2,[N2(i,1) N2(i,2)],'EdgeColor','blue')
    end
    
    if(C2(i)==2)
        highlight(h2,[N2(i,1) N2(i,2)],'EdgeColor','red')
    end
    
    if(C2(i)==3)
        highlight(h2,[N2(i,1) N2(i,2)],'EdgeColor','black')
    end
end


g3 = digraph(N3(:,1),N3(:,2));
subplot(2,2,2)
h3=plot(g3, 'XData', X3(:,1), 'YData', X3(:,2));
set(gcf, 'WindowState', 'maximized'); 
title('Target Solution','FontSize',18);


%% axis off
n=size(N3);n=n(1);
for(i=1:n)
        
    if(C3(i)==1)
        highlight(h3,[N3(i,1) N3(i,2)],'EdgeColor','blue')
    end
    
    if(C3(i)==2)
        highlight(h3,[N3(i,1) N3(i,2)],'EdgeColor','red')
    end
    
    if(C3(i)==3)
        highlight(h3,[N3(i,1) N3(i,2)],'EdgeColor','black')
    end
end


subplot(2,2,3:4)
tYP=size(YP);tYP=tYP(2);
plot(YP,"b",'LineWidth',2.0)
plot(YP,"b^",'LineWidth',3.0,'MarkerSize',5)
set(gcf, 'WindowState', 'maximized'); 
title('Evolution of the Evaluation Function', 'FontSize', 18);

ylabel('Evaluation Function',FontSize=15)
xlabel('Solution',FontSize=15)

xlim([1 tYP])


hold off






%}


end