function main()
    
    neurons = [200, 500, 800, 1200, 1500];
    fwavelet = {'db2', 'db4', 'sym3', 'sym4', 'sym5'};
    type = 'wavelet';
    
     %datasets = {{{'YALE_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL'}, fwavelet, neurons, type}, ...
      %           {{'YALE_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LH'}, fwavelet, neurons, type}, ...
       %          {{'YALE_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:HL'}, fwavelet, neurons, type}, ...
        %         {{'YALE_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL+HL'}, fwavelet, neurons, type}, ...
         %        {{'YALE_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL+HL+LH'}, fwavelet, neurons, type}, ...
          %       {{'AR_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL'}, fwavelet, neurons, type}, ...
           %      {{'AR_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LH'}, fwavelet, neurons, type}, ...
            %     {{'AR_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:HL'}, fwavelet, neurons, type}, ...
             %    {{'AR_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL+HL'}, fwavelet, neurons, type}, ...
              %   {{'AR_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL+HL+LH'}, fwavelet, neurons, type}, ...
               %  {{'SDUMLA_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL'}, fwavelet, neurons, type}, ...
                % {{'SDUMLA_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LH'}, fwavelet, neurons, type}, ...
                 %{{'SDUMLA_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:HL'}, fwavelet, neurons, type}, ...
                 %{{'SDUMLA_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL+HL'}, fwavelet, neurons, type}, ...
                 %{{'SDUMLA_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL+HL+LH'}, fwavelet, neurons, type}};
            
    
    datasets = {{{'ORL_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL'}, fwavelet, neurons, type}, ...
                {{'ORL_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LH'}, fwavelet, neurons, type}, ...
                {{'ORL_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:HL'}, fwavelet, neurons, type}, ...
                {{'ORL_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL+HL'}, fwavelet, neurons, type}, ...
                {{'ORL_Viola_Jones-WAVELET-TRANSFORM-LEVEL:3-COMBINATION:LL+HL+LH'}, fwavelet, neurons, type}};
    for dts = 1:size(datasets, 2)
        
        dataset = datasets{dts}{1};
        parameters = datasets{dts}{2};
        neurons = datasets{dts}{3};
        param = datasets{dts}{4};
        
        k_fold_3(dataset, parameters, neurons, param);
        
    end
end

