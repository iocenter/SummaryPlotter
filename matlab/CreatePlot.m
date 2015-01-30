function CreatePlot( pd, folder, index )
%CREATEPLOT Creates a plot from a PlotData object
%   The plot is saved in the input folder

properties = PlotProperties(); % Get properties struct
cm = ColorMapper();

fh = figure('Visible', 'off');
ah = axes();
th = title(pd.title);

% Setting axis labels and settings
xlh = xlabel(ah, pd.xlabel);
ylh = ylabel(ah, pd.ylabel);

% Plotting
hold on;
for i=1:pd.ysets
    p = plot(pd.xdata, pd.ydata(i,:));
    set(p, 'LineWidth', properties.line.style.LineWidth);
    set(p, 'Color', cm.get_next(pd.ytypes{i}));
end

lh = legend(pd.ynames);
ApplyPlotSettings(fh, ah, th, xlh, ylh, lh);

file_path = strcat(folder, '/', ... Folder path
                   num2str(index), '_', regexprep(lower(pd.title), ' ', '_'), ... File name
                   '.pdf'); % Extension

saveas(fh, file_path);
clear cm fh ah th xlh ylh lh;

print_message(file_path);

    function print_message(file_path)
        fprintf('Saved plot: %s\n', file_path);
    end

end

