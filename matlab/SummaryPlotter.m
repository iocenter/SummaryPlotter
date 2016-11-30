%% SummaryPlotter
% Plot summary data from the ECLIPSE and ADGPRS reservoir simulators.
% Allows you to save the plots as PDF documents or export the data
% to a CSV format readable by Excel, Pgfplots (a LaTeX plotting 
% package), etc.
clear all; close all; clc;

%% Provide name of pre-defined summary data file
% path to target_save_folder is also define here
summary_data_file = 'test';
% If summary_data_file = '' then path to summary data file 
% set through GUI in GetFilePath, if target_folder = '' from
% GetFilePath, then later defined through GUI in CreateBatchPlots
[summary_file_path, summary_name_path, folder_path, ...
    file_name, name, ext, target_folder] = ...
    GetFilePath(summary_data_file);

%% Select unit set
units = 'metric'; % alternative: 'field'

% Remove? ---------------------------------------------------
% Ask the user which units are to be used. The complete set 
% of units for each property is found in the Units() funtion.
% units = questdlg('Pick unit set.','Select unit set', ...
%     'field','metric', 'metric');
% -----------------------------------------------------------

%% Load custom plot config
% If nonexisting, the config is set to default values
% configname = '5spot_Case';
configname = '5spot_4i1p_hz';
config = ReadPlotConfig(configname);

%% Read Summary Data
% Uses the _ReadEcliseSummary_ or _ReadAdgprsSummary_ functions to read
% headers and values from file. Which method is used is determined by
% looking at the file name.
summary_data  = ReadSummaryData(summary_file_path, ...
    summary_name_path, ext);

%% Create plots
CreateBatchPlots(summary_data, units, config, target_folder);  


