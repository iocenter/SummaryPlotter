function config = ReadPlotConfig(configname)
% ReadPlotConfig Returns custom configuration for plots
% depending on configname

config = struct();
%%%%%%%%%%%%%%%%%%%%%%
config.FPR  = struct();
config.WBHP = struct();
config.WWCT = struct();
%%%%%%%%%%%%%%%%%%%%%%
config.FGPT = struct();
config.FOPT = struct();
config.FWPT = struct();
config.FLPT = struct();
%%%%%%%%%%%%%%%%%%%%%%%
config.WGPT = struct();
config.WWPT = struct();
config.WOPT = struct();
config.WLPT = struct();
%%%%%%%%%%%%%%%%%%%%%%%
config.FGPR = struct();
config.FOPR = struct();
config.FWPR = struct();
config.FLPR = struct();
%%%%%%%%%%%%%%%%%%%%%%%
config.WGPR = struct();
config.WOPR = struct();
config.WWPR = struct();
config.WLPR = struct();

switch configname

	case 'P07-02-Case-Ia-5spot-default'

		config.FPR.lims  = struct('ymin',160,'ymax',200,'ysc_eq',true);
		config.WBHP.lims = struct('ymin', 10,'ymax',200,'ysc_eq',false);
		config.WWCT.lims = struct('ymin',  0,'ymax',  1,'ysc_eq',false);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		config.FGPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FOPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FWPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FLPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		config.WGPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WWPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WOPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WLPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		config.FGPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FOPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FWPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FLPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		config.WGPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WOPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WWPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WLPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);

	case 'P07-02-Case-Ia-5spot-default-mult'

		config.FPR.lims  = struct('ymin',160,'ymax',200,'ysc_eq',true);
		config.WBHP.lims = struct('ymin', 10,'ymax',200,'ysc_eq',false);
		config.WWCT.lims = struct('ymin',  0,'ymax',  1,'ysc_eq',false);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		config.FGPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FOPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FWPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FLPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		config.WGPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WWPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WOPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WLPT.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		config.FGPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FOPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FWPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.FLPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		config.WGPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WOPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WWPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);
		config.WLPR.lims = struct('ymin',  0,'ymax',  0,'ysc_eq',true);

    case '5spot_Case'
        
		config.FPR.lims  = struct('ymin', 160, 'ymax', 200);
		config.WBHP.lims = struct('ymin', 160, 'ymax', 200);
		config.WWCT.lims = struct('ymin',   0, 'ymax',   1);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 		config.FGPT.lims = struct('ymin', 100, 'ymax', 200);
% 		config.FOPT.lims = struct('ymin', 100, 'ymax', 200);
% 		config.FWPT.lims = struct('ymin', 100, 'ymax', 200);
% 		config.FLPT.lims = struct('ymin', 100, 'ymax', 200);
% 		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 		config.WGPT.lims = struct('ymin', 100, 'ymax', 200);
% 		config.WWPT.lims = struct('ymin', 100, 'ymax', 200);
% 		config.WOPT.lims = struct('ymin', 100, 'ymax', 200);
% 		config.WLPT.lims = struct('ymin', 100, 'ymax', 200);
% 		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 		config.FGPR.lims = struct('ymin', 100, 'ymax', 200);
% 		config.FOPR.lims = struct('ymin', 100, 'ymax', 200);
% 		config.FWPR.lims = struct('ymin', 100, 'ymax', 200);
% 		config.FLPR.lims = struct('ymin', 100, 'ymax', 200);
% 		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 		config.WGPR.lims = struct('ymin', 100, 'ymax', 200);
% 		config.WOPR.lims = struct('ymin', 100, 'ymax', 200);
% 		config.WWPR.lims = struct('ymin', 100, 'ymax', 200);
% 		config.WLPR.lims = struct('ymin', 100, 'ymax', 200);


    case '5spot_4i1p_hz'
                
		config.FPR.lims  = struct('ymin',  160,  'ymax',  200);
		config.WBHP.lims = struct('ymin',  100,  'ymax',  260);
		config.WWCT.lims = struct('ymin',    0,  'ymax',    1);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 		config.FGPT.lims = struct('ymin',  100,  'ymax',  200);
% 		config.FOPT.lims = struct('ymin',  100,  'ymax',  200);
% 		config.FWPT.lims = struct('ymin',  100,  'ymax',  200);
% 		config.FLPT.lims = struct('ymin',  100,  'ymax',  200);
% 		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 		config.WGPT.lims = struct('ymin',  100,  'ymax',  200);
% 		config.WWPT.lims = struct('ymin',  100,  'ymax',  200);
% 		config.WOPT.lims = struct('ymin',  100,  'ymax',  200);
% 		config.WLPT.lims = struct('ymin',  100,  'ymax',  200);
% 		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 		config.FGPR.lims = struct('ymin',  100,  'ymax',  200);
		config.FOPR.lims = struct('ymin',    0,  'ymax', 2000);
		config.FWPR.lims = struct('ymin',-2000,  'ymax', 2000);
		config.FLPR.lims = struct('ymin',-2000,  'ymax', 2000);
% 		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 		config.WGPR.lims = struct('ymin',  100,  'ymax',  200);
		config.WOPR.lims = struct('ymin',    0,  'ymax', 2000);
		config.WWPR.lims = struct('ymin',-2000,  'ymax', 2000);
		config.WLPR.lims = struct('ymin',-2000,  'ymax', 2000);

	otherwise

		configname = 'default';

end
 
fprintf('Config %s chosen.\n', configname)

end
