clear all
close all
clc
% Resolu��o da Curva ROC
 Roc=500;
% Arquivo contendo na coluna 1 a sa�da verdadeira, coluna i, com i sendo
% igual ao melhor par�metro, sendo as sa�das do melhor modelo.
load('Saida_Curvelet_Face_3_LSSVM.mat')
% Estrutura que ir� armazenar as sa�das verdadeiras
Saida(:,1)=ClasseSaida(:,1);
% Saida do classificador
Saida(:,2)=ClasseSaida(:,5);
% Armazena o valor de semelhan�a do dado com a classe de sa�da
Saida(:,3)=zeros(length(Saida),1);
% Cria um conjunto de Matrizes de Confus�o
Mc=zeros(2,2,Roc);
% Carrega a matriz de semelhan�a dos dados
load('MaisSemelhantes_Face_Curvelet_Nivel_3.mat')
Semelhanca=MaisSemCurv;
% Verifica se cada dado foi classificado corretamente pelo sistema e se ele
% deve ser aceito ou n�o de acordo com um limiar variando de 0.01 at� 1
for d=1:length(Saida)
    Saida(d,3)=Semelhanca(d,Saida(d,2));
    for i=1:Roc
        tr=(1/Roc)*i;
        %         Verdadeiro Positivo
        if(Saida(d,1)==Saida(d,2) && Saida(d,3)>=tr)
            Mc(1,1,i)=Mc(1,1,i)+1;
            %             Falso Negativo
        elseif(Saida(d,1)==Saida(d,2) && Saida(d,3)<tr)
            Mc(2,1,i)=Mc(2,1,i)+1;
            %             Falso Positivo
        elseif(Saida(d,1)~=Saida(d,2) && Saida(d,3)>=tr)
            Mc(1,2,i)=Mc(1,2,i)+1;
            %             Verdadeiro Negativo
        elseif(Saida(d,1)~=Saida(d,2) && Saida(d,3)<tr)
            Mc(2,2,i)=Mc(2,2,i)+1;
        end
    end
end
figure
% Calcula as taxas para a curva ROC
for tx=1:Roc
    %     Taxa de Falsa Aceita��o
    FAR(tx)=Mc(1,2,tx)/(Mc(1,2,tx)+Mc(2,2,tx));
    %     Taxa de Falsa Rejei��o
    FRR(tx)=Mc(2,1,tx)/(Mc(1,1,tx)+Mc(2,1,tx));
end
Y=1/Roc:1/Roc:1;
plot(Y,FAR,'r',Y,FRR,'b')
box off
set(gca,'FontSize',12)
axis([0,1.01,0,1.01])
title('Taxa de Falsa Aceita��o X Taxa de Falsa Rejei��o')
xlabel('Limiar de Semelhan�a');
ylabel('Valor da Taxa');
legend('Falsa Aceita��o','Falsa Rejei��o','Fontsize',8,'Location','southoutside');
saveas(gcf,'C:\Users\Daniel\Dropbox\Daniel\Face\Bases\ShumlaDatabase\Scripts\Auxiliares\ROC\CurvaROC_Face_Unimodal.jpg');
% Salva a estrutura
resultado.MC=Mc;
resultado.FAR=FAR;
resultado.FRR=FRR;
resultado.Saida=Saida;
arqSaida='C:\Users\Daniel\Dropbox\Daniel\Face\Bases\ShumlaDatabase\Scripts\Auxiliares\ROC\Arquivo_ROC_Face_Curvelet_3_Unimodal.mat';
save(arqSaida,'resultado');
clear resultado