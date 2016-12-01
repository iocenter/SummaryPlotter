function [ ] = CreateBatchPlots( summary_data, ...
    units, config, folder )
%CREATEBATCHPLOTS Batch creation of plots.
%   The summary_data parameter is a struct of the 
%   simulation summary data.
% 
%   The units parameter is a struct with mappings 
%   from properties to units.
% 
%   config: struct containing plot properties for 
%   each data type
% 
%   folder: target folder where to print plot

% As user where to save plots
if nargin ~= 4;
    folder = uigetdir('','Select directory to save the plots in');
end

% Delete old plots in current target folder
if isunix 
    [status,cmdout] = system(['cd ' folder '; rm -f *.pdf ;']);
end

mdata = size(summary_data, 2) == 1;

if mdata

    % Make function list of all datatypes to be plotted
    plot_list = GetPlotList(summary_data, units, config, folder);

else

    % Make function list of all datatypes to be plotted
    plot_list = GetPlotListMult(summary_data, units, config, folder);

end

% Make plots
for pp = 1 : length(plot_list)
    plot_list{pp}()
end

% Assemble all plots into a single pdf
if isunix
    output_file = 'all_graphs.pdf';
    system(['cd ' folder '; pwd; rm -f ' output_file ';']);
    system(['cd ' folder '; pdftk *.pdf output ' output_file ';']);
end

end
