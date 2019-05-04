function processing_table_results()

    %parametros para cada problema
    datasets = {'YALE', 'AR', 'SDUMLA', 'JAFFE'};
    extraction = 'WAVELET';
    param_extractor = 'FWAVELET';
    classifies = {'KNN', 'K'};
    
    %tabelas para a transformada de fourier datasets: YALE, AR e SDUMLA
    if strcmp(extraction, 'FOURIER-TRANSFORM')
        
        for dts = 1:size(datasets, 2)
            
            str_folder = strcat('RESULTS-', datasets{dts}, '_Viola_Jones-', extraction);
            disp(strcat('TABLE-',str_folder));
            get_table_results(str_folder, classifies, extraction, param_extractor);
        end
        
    end
    
    %tabelas para o extrator LBP datasets: YALE, AR e SDUMLA
    if strcmp(extraction, 'LOCAL-BINARY-PATTERN')
        
        for dts = 1:size(datasets, 2)
            
            str_folder = strcat('RESULTS-', datasets{dts}, '_Viola_Jones-', extraction);
            disp(strcat('TABLE-',str_folder));
            get_table_results(str_folder, classifies, extraction, param_extractor);
        end
        
    end
    %tabelas para a transformada wavelet datasets: YALE, AR e SDUMLA
    if strcmp(extraction, 'WAVELET')
        
        levels = [3];
        combinations = {'HL', 'LH', 'LL', 'LL+HL', 'LL+HL+LH'};
        
        for dts = 1:size(datasets, 2)
            for lvs = 1:size(levels, 2)
            
                for cmb = 1:size(combinations, 2)
                    str_folder = strcat('RESULTS-', datasets{dts}, '_Viola_Jones-', extraction, '-TRANSFORM-LEVEL:', num2str(levels(lvs)), '-COMBINATION:', combinations{cmb});
                    disp(strcat('TABLE-',str_folder));
                    get_table_results(str_folder, classifies, extraction, param_extractor);
                end
            end
        end
    end
end