%% SummaryPlotter
% Plot summary data from the ECLIPSE and ADGPRS reservoir simulators.
% Allows you to save the plots as PDF documents or export the data
% to a CSV format readable by Excel, Pgfplots (a LaTeX plotting
% package), etc.
clear all; close all; clc;
stime = tic;

%% Provide name of custom summary data file; can be set to empty, 
% i.e., summary_data_file = '', in which case a GUI will appear
% and you can set the path to summary data file manually using
% the GUI
custom_data_path = 'P07-02-Case-Ia-5spot-default-mult';

% Comment this:
[summary_file_path, summary_name_path, folder_path, ...
    file_name, name, ext, target_folder] = ...
    GetFilePath(custom_data_path);
% or this:
% [summary_file_path, summary_name_path, folder_path, ...
%     file_name, name, ext, target_folder] = ...
%     GetFilePath('');

% Get Path To Summary Data File
% If file_name and folder_path not given, then it will open up a gui 
% to find these
% [summary_file_path, summary_name_path, folder_path, ...
% remove:  
%     file_name, name, ext] = GetFilePath(file_name, folder_path);

%% Select unit set
units = 'metric'; % alternative: 'field'

%% Load custom plot config
config = ReadPlotConfig(custom_data_path);

%% Read Summary Data
% Uses the _ReadEcliseSummary_ or _ReadAdgprsSummary_ functions to read
% headers and values from file. Which method is used is determined by
% looking at the file name.
summary_data  = ReadSummaryData(summary_file_path, ...
    summary_name_path, ext);

%% Create plots
% option 1: provide only 'summary_data, units, config'; it will
% then ask where the plots are to be stored
% option 2: provide 'summary_data, units, config, target_folder'
CreateBatchPlots(summary_data, units, config, target_folder);

etime = toc(stime);
fprintf('Total time used for plotting %3.1f minutes.', etime/60);
