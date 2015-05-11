function [ file_path, name_path, folder_path, file_name, ...
    name, ext ] = GetFilePath()
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

file_path = strcat(folder_path, file_name);
name_path = strcat(folder_path, name);

fprintf('%s selected.\n', file_path);
fprintf('Extension is %s.\n', ext);

end

