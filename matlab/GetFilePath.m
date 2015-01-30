function [ file_path, folder_path, file_name, name, ext ] = ...
    GetFilePath()
%GETFILEPATH Get file path
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
%   * file_name: The file name, including extension.
%     Example: rslts_ECL_ECLak_gefac.mat

%   * folder_path: The path to the directory containing the file.
%     Example: /home/einar/Documents/git/master/SummaryPlotter/test_data

%   * name: The name of the file, excluding extension.
%     Example: rslts_ECL_ECLak_gefac

%   * ext: The file extension.
%     Example: .mat

fprintf('file_path has not been provided as a parameter.\n');
fprintf('Select a summary file.\n');
[file_name, folder_path, filter_index] = uigetfile( ...
    {'*.mat';'*.UNSMRY'},'Select summary file');
C = strsplit(file_name, '.');
name = C{1};
ext = C{2};
file_path = strcat(folder_path, file_name);

end

