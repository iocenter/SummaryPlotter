%% SummaryPlotter
% Plot summary data from the ECLIPSE and ADGPRS reservoir simulators.
% Allows you to save the plots as PDF documents or export the data
% to a CSV format readable by Excel, Pgfplots (a LaTeX plotting 
% package), etc.
clear all; close all; clc;

%% Get Path To Summary Data File
[summary_file_path, folder_path, file_name, name, ext] = GetFilePath();

    
%% Read Summary Data
% Use the _ReadEcliseSummary_ or _ReadAdgprsSummary_ function to read
% headers and values from file. Which method is used is determined by
% looking at the file name.

if strcmp(ext, 'mat')
    fprintf('Reading saved matlab variable (*.mat).\n');
    summary_data = load(summary_file_path);
    
elseif strcmp(ext, 'UNSMRY')
    
    fprintf([ 'Using MRST libraries to read '...
        'Eclipse summary file (*.UNSMRY).\n' ]);
    
    if 1 % exist('readEclipseOutputFileUnFmt', 'file') == 0
    
        fprintf('Path to MRST libraries not found.\n');
        
        [ mrst_file_path, mrst_folder_path, ~, ~, ~ ] = ...
        GetMRSTPath();
    
        fprintf('MRST libraries found in: %s\n', mrst_folder_path);
        
        run(mrst_file_path);
        
        fprintf('Adding ad-fi and deckformat modules...\n');
        
        mrstModule add ad-fi deckformat
        
    end
    
    summary_data = ReadEclipseSummary(name);    

else
    fprintf([ 'File extension/format not '...
        'reconized. The allowed extensions' ])
    fprintf('are .mat, .UNSMRY and .HDF5\');
end

%% Select Plot Creation Mode
% Ask the user whether to use Automatic Batch Mode or Custom Mode.
% Automatic Batch Mode creates all commonly used plots with predefined
% settings.
% Custom Mode allows the user to create a single plot with customized
% data and settings.
mode = questdlg('qstring','Select Plot Creaton Mode', ...
    'Batch','Custom', 'Batch');
switch mode
    case 'Batch'
        CreateBatchPlots(summary_data);
    case 'Custom'
        properties_to_be_plotted = SelectSummaryData(summary_data);
        fh = CreateCustomPlot(properties_to_be_plotted);
        shg; % Show the plot
end


