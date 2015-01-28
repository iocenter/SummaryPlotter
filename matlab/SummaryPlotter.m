%% SummaryPlotter
% Plot summary data from the ECLIPSE and ADGPRS reservoir simulators.
% Allows you to save the plots as PDF documents or export the data
% to a CSV format readable by Excel, Pgfplots (a LaTeX plotting package)
% etc.

%% Read Summary Data File(s)
% Use the _ReadEcliseSummary_ or _ReadAdgprsSummary_ function to read
% headers and values from files. Requires the user to provide the path(s)
% to the file(s).

%% Select Data To Be Plotted
% Ask the user to select which of the available summary vectors to plot.

%% Create Plot
% Create the plot. It will initially be hidden.
% Ask the user if the plot is to be shown, printed to PDF or stored
% as CSV values.