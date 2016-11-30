function [ file_path, name_path, folder_path, file_name, ...
    name, ext, target_folder ] = GetFilePath(varargin)
%% GETFILEPATH Get file path
%   Asks the user to select a file via a uigetfile window.
%   Returns the full file path, as well as the folder path, 
%   file name and extension in separate variables.
%
%   At the end of the function, the created variables contain
%   the following:
% 
%   * file_path: Contains the full path to the file.
%     Example: /home/einar/Documents/git/master
%              /SummaryPlotter/test_data/rslts_ECL_ECLak_gefac.mat
% 
%   * name_path: The file name with full path excluding extension.
%     Example: /home/einar/Documents/git/master
%              /SummaryPlotter/test_data/rslts_ECL_ECLak_gefac
% 
%   * file_name: The file name, including extension.
%     Example: rslts_ECL_ECLak_gefac.mat
% 
%   * folder_path: The path to the directory containing the file.
%     Example: /home/einar/Documents/git/master/SummaryPlotter/test_data
% 
%   * name: The name of the file, excluding extension.
%     Example: rslts_ECL_ECLak_gefac
% 
%   * ext: The file extension.
%     Example: .mat

%% 
if nargin ~= 2;

	fprintf('file_path has not been provided as a parameter.\n');
	fprintf('Select a summary file (*.H5, *.UNSMRY, or *.mat):\n');

	[file_name, folder_path, ~] = uigetfile( ...
	    {'*.H5'; '*.UNSMRY'; '*.mat';},...
	    'Select summary file (*.H5, *.UNSMRY, or *.mat)');

else

	fprintf('file_path and folder_path provided by user.\n');
	
end

C = strsplit(file_name, '.');

if ~isempty(varargin)

	switch varargin{1}

	case 'test'

		predef             = true;
		summary_file_path  = '/home/bellout/git/SummaryPlotter/test_data/ADG_5SPOT_gradient_with_DISCRETE.SIM.H5';
		summary_name_path  = '/home/bellout/git/SummaryPlotter/test_data/ADG_5SPOT_gradient_with_DISCRETE.SIM';
		folder_path        = '/home/bellout/git/SummaryPlotter/test_data/';
		file_name          = 'ADG_5SPOT_gradient_with_DISCRETE.SIM.H5';
		name               = 'ADG_5SPOT_gradient_with_DISCRETE.SIM';
		ext                = 'H5';
		target_folder      = '/home/bellout/git/SummaryPlotter/test_plots';

	case '5spot_mjcase_s5'

		predef             = true;
		folder_path        = {[ '/home/bellout/Dropbox/SharedFolderMJ/WplcOpt_PSO_MJ'...
							   '/studies/5spot_s5_uncertainty/models/ADGPRS/run0/' ], ...
							  [ '/home/bellout/Dropbox/SharedFolderMJ/WplcOpt_PSO_MJ'...
							   '/studies/5spot_s5_uncertainty/models/Eclipse/run0/' ]};
							  % 
		summary_file_path  = {[ folder_path{1} '/ADG_5SPOT_gradient_with_DISCRETE.SIM.H5' ], ...
							  [ folder_path{2} '/ECL_5SPOT.UNSMRY' ]};
							  % 
		summary_name_path  = {[ folder_path{1} '/ADG_5SPOT_gradient_with_DISCRETE.SIM' ],...
							  [ folder_path{2} '/ECL_5SPOT' ]};
							  % 
		file_name          = { 'ADG_5SPOT_gradient_with_DISCRETE.SIM.H5', ...
							   'ECL_5SPOT.UNSMRY' };
							  % 		
		name               = { 'ADG_5SPOT_gradient_with_DISCRETE.SIM', ...
		 					   'ECL_5SPOT' };
		 					  % 
		ext                = { 'H5', 'UNSMRY' };
							  % 
		target_folder      = [ '/home/bellout/Dropbox/SharedFolderMJ/WplcOpt_PSO_MJ'...
									   '/studies/5spot_s5_uncertainty/models/plots' ];

	end

end

if ~predef

	fprintf('file_path has not been provided as a parameter.\n');
	fprintf('Select a summary file (*.H5, *.UNSMRY, or *.mat):\n');
	[file_name, folder_path, ~] = uigetfile( ...
	    {'*.H5'; '*.UNSMRY'; '*.mat';},...
	    'Select summary file (*.H5, *.UNSMRY, or *.mat)');
	C = strsplit(file_name, '.');

	szC = size(C,2);

	if szC==2
	    
		name = C{1};
		ext = C{2};

	elseif szC>2

		D = C(1:szC-1);
		name = strjoin(D,'.');
		ext = C{szC};

	end

end

% Output to user
file_path = strcat(folder_path, file_name);
name_path = strcat(folder_path, name);

fprintf('%s selected.\n', file_path{:});
fprintf('Extension is %s.\n', ext{:});

end

