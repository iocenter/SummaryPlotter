%% SummaryPlotter
% Plot summary data from the ECLIPSE and ADGPRS reservoir simulators.
% Allows you to save the plots as PDF documents or export the data
% to a CSV format readable by Excel, Pgfplots (a LaTeX plotting package)
% etc.
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
else
    fprintf('File extension/format not reconized. The allowed extensions')
    fprintf('are .mat, .UNSMRY and .HDF5\');
end

%% Select Data To Be Plotted
% Ask the user to select which of the available summary vectors to plot.
properties_to_be_plotted = SelectSummaryData(summary_data);

%% Create Plot
% Create the plot. It will initially be hidden.
% Ask the user if the plot is to be shown, printed to PDF or stored
% as CSV values.
fh = CreatePlot(properties_to_be_plotted);
shg; % Show the plot
