%% SummaryPlotter
% Plot summary data from the ECLIPSE and ADGPRS reservoir simulators.
% Allows you to save the plots as PDF documents or export the data
% to a CSV format readable by Excel, Pgfplots (a LaTeX plotting 
% package), etc.
clear all; close all; clc;

%% Get Path To Summary Data File
[summary_file_path, summary_name_path, folder_path, ...
    file_name, name, ext] = GetFilePath();

%% Select unit set
% Ask the user which units are to be used. The complete set of units for
% each property is found in the Units() funtion.
units = questdlg('Pick unit set.','Select unit set', ...
    'field','metric', 'metric');

%% Custom plot config
configname = '5spot_Case';
config = ReadPlotConfig(configname);

    
%% Read Summary Data
% Uses the _ReadEcliseSummary_ or _ReadAdgprsSummary_ functions to read
% headers and values from file. Which method is used is determined by
% looking at the file name.
summary_data  = ReadSummaryData(summary_file_path, ...
    summary_name_path, ext);


%% Create plots
CreateBatchPlots(summary_data, units, config);


