% CustomFilePaths.m

function [summary_file_path summary_name_path folder_path ...
file_name name ext target_folder] = CustomFilePaths(data_name)

switch data_name

case 'test'

	summary_file_path  = '/home/bellout/git/SummaryPlotter/test_data/ADG_5SPOT_gradient_with_DISCRETE.SIM.H5';
	summary_name_path  = '/home/bellout/git/SummaryPlotter/test_data/ADG_5SPOT_gradient_with_DISCRETE.SIM';
	folder_path        = '/home/bellout/git/SummaryPlotter/test_data/';
	file_name          = 'ADG_5SPOT_gradient_with_DISCRETE.SIM.H5';
	name               = 'ADG_5SPOT_gradient_with_DISCRETE.SIM';
	ext                = 'H5';
	target_folder      = '/home/bellout/git/SummaryPlotter/test_plots';

case '5spot_mjcase_s5'

	folder_path        = {[ '/home/bellout/Dropbox/SharedFolderMJ/WplcOpt_PSO_MJ'...
						   '/studies/5spot_s5_uncertainty/models/ADGPRS/run0/' ], ...
						  [ '/home/bellout/Dropbox/SharedFolderMJ/WplcOpt_PSO_MJ'...
						   '/studies/5spot_s5_uncertainty/models/Eclipse/run0/' ]};
	summary_file_path  = {[ folder_path{1} '/ADG_5SPOT_gradient_with_DISCRETE.SIM.H5' ], ...
						  [ folder_path{2} '/ECL_5SPOT.UNSMRY' ]};
	summary_name_path  = {[ folder_path{1} '/ADG_5SPOT_gradient_with_DISCRETE.SIM' ],...
						  [ folder_path{2} '/ECL_5SPOT' ]};
	file_name          = { 'ADG_5SPOT_gradient_with_DISCRETE.SIM.H5', ...
						   'ECL_5SPOT.UNSMRY' };
	name               = { 'ADG_5SPOT_gradient_with_DISCRETE.SIM', ...
	 					   'ECL_5SPOT' };
	ext                = { 'H5', 'UNSMRY' };
	target_folder      = [ '/home/bellout/Dropbox/SharedFolderMJ/WplcOpt_PSO_MJ'...
								   '/studies/5spot_s5_uncertainty/models/plots' ];

case 'P07-02-Case-Ia-5spot-default'

	root_dir           = '/home/bellout/WORK-3/SCRATCH_RUNS-PROJECTS/P07-02-Case-Ia-5spot-default'; 
	summary_file_path  = [ root_dir '/60X60-CG-1W-DO.vars.h5' ];
	summary_name_path  = [ root_dir '/60X60-CG-1W-DO.vars' ];
	folder_path        = [ root_dir '/' ];
	file_name          = '60X60-CG-1W-DO.vars.h5';
	name               = '60X60-CG-1W-DO.vars';
	ext                = 'h5';
	target_folder      = [ root_dir '/production-profiles' ];;

case 'P07-02-Case-Ia-5spot-default-mult'

	root_dir           = {'/home/bellout/WORK-3/SCRATCH_RUNS-PROJECTS/P07-02-Case-Ia-5spot-default' ...
					      '/home/bellout/WORK-3/SCRATCH_RUNS-PROJECTS/P07-01-study-IJK-vert-well-ov-opt/60x60-CG-1w-do' }; 
	summary_file_path  = { [ root_dir{1} '/60X60-CG-1W-DO.vars.h5' ] ...
	                       [ root_dir{2} '/60x60-CG-1w-do/60X60-CG-1W-DO_Tue_Nov_22_20_50_36_2016.vars.h5' ] };
	summary_name_path  = { [ root_dir{1} '/60X60-CG-1W-DO.vars' ] ...
	                       [ root_dir{2} '/60x60-CG-1w-do/60X60-CG-1W-DO_Tue_Nov_22_20_50_36_2016.vars' ] };
	folder_path        = { [ root_dir{1} '/' ] ...
	                       [ root_dir{2} '/' ] };
	file_name          = { '60X60-CG-1W-DO.vars.h5' '60X60-CG-1W-DO_Tue_Nov_22_20_50_36_2016.vars.h5' };
	name               = { '60X60-CG-1W-DO.vars' '60X60-CG-1W-DO_Tue_Nov_22_20_50_36_2016.vars' };
	ext                = { 'h5' 'h5' };
	target_folder      = [ root_dir{1} '/production-profiles-mult' ];	

end




