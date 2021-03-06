function CreatePlot( pd, folder, index, lims )
%CREATEPLOT Creates a plot from a PlotData object
%   The plot is saved in the input folder
%   pd must be a PlotData object.

debug_output = false;

properties = PlotProperties(); % Get properties struct
cm = ColorMapper();

% PROBLEM: Windows keep coming up despite Visible=Off
fh = figure('Visible', 'off');
ah = axes();
th = title(pd.title);

% Setting axis labels and settings
xlh = xlabel(ah, pd.xlabel);
ylh = ylabel(ah, pd.ylabel);
ynames = {};

% Plotting
hold on;

for jj = 1 : size(pd.ydata,2)

    if debug_output
        fprintf('[%s] pd data: ', mfilename);
        fprintf('pd.xdata [%d %d] - ', size(pd.xdata{jj}));
        fprintf('pd.ydata [%d %d] - ', size(pd.ydata{jj}));
    end

size(pd.ydata)
size(pd.ydata{jj})
size(pd.ydata{jj}(:))
size(pd.ydata{jj}{:})

    p(jj) = plot(pd.xdata{jj}, pd.ydata{jj}{:});
    set(p(jj), 'LineWidth', properties.line.style.LineWidth);
    set(p(jj), 'Color', cm.get_next(pd.ytypes{jj}{:}));

    ynames{jj} = pd.ynames{jj}{1};

    ymin{jj}   = min(vertcat(pd.ydata{jj}{:}));
    ymax{jj}   = max(vertcat(pd.ydata{jj}{:}));

    xmin{jj}   = min(pd.xdata{jj});
    xmax{jj}   = max(pd.xdata{jj});

end

% Legend
lh = legend(ynames);

% clc
lims.xmin = min(vertcat(xmin{:}));
lims.xmax = min(vertcat(xmax{:}));
lims.ymin = 0;
lims.ymax = 1;
    

% Check if custom property is specified
loc_conf = struct();
typename = fieldnames(pd.config);
evalIn = [ 'loc_conf = pd.config.' typename{1} ';' ];
eval(evalIn);

if isfield(loc_conf, 'lims')

    lims.ymin = loc_conf.lims.ymin;
    lims.ymax = loc_conf.lims.ymax;
    
elseif min(vertcat(ymin{:})) < max(vertcat(ymax{:}))
    
    lims.ymin = min(vertcat(ymin{:}));
    lims.ymax = max(vertcat(ymax{:}));
    
end

ApplyPlotSettings(fh, ah, th, xlh, ylh, lh, lims);

file_path = strcat(folder, '/', ... Folder path
   num2str(index), '_', regexprep(lower(pd.title), ' ', '_'), ... File name
   '.pdf'); % Extension

% Save plot
saveas(fh, file_path);
clear cm fh ah th xlh ylh lh;

print_message(file_path);

    function print_message(file_path)
        fprintf('Saved plot: %s\n', file_path);
    end

end

