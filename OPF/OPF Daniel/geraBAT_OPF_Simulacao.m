% Gera o bat contendo os comendos para treinar, testar e gerar o arquivo de
% sa�da contendo a acur�cia do teste.
% Roteiro de Treinamento e Testes
% opf_train Face\Face_Wavelet_DB2_Fold_1_Treino.opf Distancias\Face_Wavelet_DB2_Euclidiana.dat
% opf_classify Face\Face_Wavelet_DB2_Fold_1_Teste.opf Distancias\Face_Wavelet_DB2_Euclidiana.dat
% opf_accuracy Face\Face_Wavelet_DB2_Fold_1_Teste.opf

Distancias={'Euclidiana','Manhattan','SquareChi-Squared'};
Car={'Face','Iris'};
Abordagens={'MIN_MAX','MEAN_MAX','FACE_LL_IRIS','IRIS_LL_FACE','Concatenacao','EDGE','Soma','SomaPonderada'};
Wavelets={'DB2','DB4','SYM3','SYM4','SYM5'};
folds=10;
arq='C:\Users\Daniel\Desktop\OPF\OPF\ExecutaTestesOPF.bat';
fid=fopen(arq,'w');
 for c=1:length(Car)
     for d=1:length(Distancias)
         for w=1:length(Wavelets)
             for k=1:folds
                 ArqTreino=strcat(Car{c},'\',Car{c},'_Wavelet_',Wavelets{w},'_Fold_',int2str(k),'_Treino.opf');
                 ArqTeste=strcat(Car{c},'\',Car{c},'_Wavelet_',Wavelets{w},'_Fold_',int2str(k),'_Teste.opf');
                 ArqDist=strcat('Distancias\',Car{c},'_Wavelet_',Wavelets{w},'_',Distancias{d},'.dat');
                 fprintf(fid,'opf_train %s %s \n',ArqTreino,ArqDist);
                 fprintf(fid,'opf_classify %s %s \n',ArqTeste,ArqDist);
                 fprintf(fid,'opf_accuracy %s \n',ArqTeste);
             end
         end
     end
 end
for a=1:length(Abordagens)
    for d=1:length(Distancias)
        for w=1:length(Wavelets)
            for k=1:folds
                ArqTreino=strcat('FaceIris\FaceIris_',Abordagens{a},'_Wavelet_',Wavelets{w},'_Fold_',int2str(k),'_Treino.opf');
                ArqTeste=strcat('FaceIris\FaceIris_',Abordagens{a},'_Wavelet_',Wavelets{w},'_Fold_',int2str(k),'_Teste.opf');
                ArqDist=strcat('Distancias\FaceIris_',Abordagens{a},'_Wavelet_',Wavelets{w},'_',Distancias{d},'.dat');
                fprintf(fid,'opf_train %s %s \n',ArqTreino,ArqDist);
                fprintf(fid,'opf_classify %s %s \n',ArqTeste,ArqDist);
                fprintf(fid,'opf_accuracy %s \n',ArqTeste);
            end
        end
    end
end
fclose(fid);