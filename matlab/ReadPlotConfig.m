function config = ReadPlotConfig(configname)
% ReadPlotConfig Returns custom configuration for plots
% depending on configname


config = struct(...
'FPR',{}, 'FGPR',{}, 'FLPR',{}, 'FOPR',{}, 'FWPR',{}, ...
'FGPT',{}, 'FLPT',{}, 'FOPT',{}, 'FWPT',{}, 'WGPR',{}, ... 
'WLPR',{}, 'WOPR',{}, 'WWPR',{}, 'WGPT',{}, 'WLPT',{}, ...
'WOPT',{}, 'WWPT',{}, 'WBHP',{}, 'WWCT',{});

switch configname

    case '5spot_Case'
        
        config.FPR.lims.ymin = 100;
        config.FPR.lims.ymax = 200;
        
end
    





