%% SummaryPlotter
% Plot summary data from the ECLIPSE and ADGPRS reservoir simulators.
% Allows you to save the plots as PDF documents or export the data
% to a CSV format readable by Excel, Pgfplots (a LaTeX plotting
% package), etc.
clear all; close all; clc;
stime = tic;

%% Provide name of pre-defined summary data file
% path to target_save_folder is also define here
summary_data_file = 'test';

folder_path='/home/bellout/WORK-3/SCRATCH_RUNS-PROJECTS/scratch-P02_Constrained_CntrlOpt-OV/cntrlopt-sims-test/001/';
file_name='GPRS_WECON_HALT_SN.UNSMRY';
units='metric';
output_dir= [folder_path '/figs'];

% If summary_data_file = '' then path to summary data file 
% set through GUI in GetFilePath, if target_folder = '' from
% GetFilePath, then later defined through GUI in CreateBatchPlots

% Get Path To Summary Data File
% If file_name and folder_path not given, then it will open up a gui 
% to find these
[summary_file_path, summary_name_path, folder_path, ...
    file_name, name, ext] = GetFilePath(file_name, folder_path);
    
[summary_file_path, summary_name_path, folder_path, ...
    file_name, name, ext, target_folder] = ...
    GetFilePath(summary_data_file);

%% Select unit set
units = 'metric'; % alternative: 'field'

%% Load custom plot config
% If nonexisting, the config is set to default values
% configname = '5spot_Case';
configname = '5spot_4i1p_hz';
% configname = 'brugge_378';
config = ReadPlotConfig(configname);

%% Read Summary Data
% Uses the _ReadEcliseSummary_ or _ReadAdgprsSummary_ functions to read
% headers and values from file. Which method is used is determined by
% looking at the file name.
summary_data  = ReadSummaryData(summary_file_path, ...
    summary_name_path, ext);

%% Create plots
% option 1: provide only 'summary_data, units, config'; it will
% then ask where the plots are to be stored
% option 2: provide 'summary_data, units, config, output_dir'
CreateBatchPlots(summary_data, units, config, output_dir);


etime = toc(stime);
fprintf('Total time used for plotting %3.1f minutes.', etime/60);
