function CreatePlot( pd, folder, index )
%CREATEPLOT Creates a plot from a PlotData object
%   The plot is saved in the input folder
%   pd must be a PlotData object.

debug_output = true;

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

if ~iscell(pd.ydata)

    fprintf('%s is NOT cell\n','pd.ydata');
    n_cols = 1;

else

    fprintf('%s IS cell\n','pd.ydata');
    n_cols = size(pd.ydata, 2);

end

for jj = 1 : n_cols

    if debug_output
        fprintf('[%s] pd data: ', mfilename);
        fprintf('pd.xdata [%d %d] - ', size(pd.xdata{jj}));
        fprintf('pd.ydata [%d %d]\n', size(pd.ydata{jj}));
        fprintf('size(pd.ydata) [%d %d] - ', size(pd.ydata));
        fprintf('size(pd.ydata{jj}) [%d %d] - ', size(pd.ydata{jj}));
        fprintf('size(pd.ydata{jj}(:)) [%d %d]\n', size(pd.ydata{jj}(:)));
    end

    p(jj) = plot(pd.xdata{jj}', pd.ydata{jj});

% properties.line.style.LineStyle{j

    LineStyle = {'-', ':' };

    set(p(jj), 'LineWidth', properties.line.style.LineWidth);
    set(p(jj), 'Color', cm.get_next(pd.ytypes{jj}{:}));
    set(p(jj), 'LineStyle', LineStyle{jj} );

    if jj==2; txtmod = 'opt'; else txtmod=''; end
    ynames{jj} = [ pd.ynames{jj}{1} txtmod ];

    ymin{jj}   = min(vertcat(pd.ydata{jj}));
    ymax{jj}   = max(vertcat(pd.ydata{jj}));

    xmin{jj}   = min(pd.xdata{jj});
    xmax{jj}   = max(pd.xdata{jj});

end

% Legend
lh = legend(p, ynames);


% =========================================================
% LIMITS

% clc
lims.xmin = min(vertcat(xmin{:}));
lims.xmax = min(vertcat(xmax{:}));
lims.ymin = 0;
lims.ymax = 1;

if ~iscell(pd.ydata)

    % Check if custom property is specified
    loc_conf = struct();
    typename = fieldnames(pd.config);
    evalIn = [ 'loc_conf = pd.config.' typename{1} ';' ];
    eval(evalIn);

    if isfield(loc_conf, 'lims') & isfield(loc_conf.lims, 'ysc_eq')

        if loc_conf.lims.ysc_eq & ...
            (loc_conf.lims.ymin_all < loc_conf.lims.ymax_all)

            % Apply found upper and lower limits for all wells
            lims.ymin = loc_conf.lims.ymin_all;
            lims.ymax = loc_conf.lims.ymax_all;

        else

            % revert to custom config for limits
            lims.ymin = loc_conf.lims.ymin;
            lims.ymax = loc_conf.lims.ymax;

        end

    elseif min(vertcat(ymin{:})) < max(vertcat(ymax{:}))

        lims.ymin = min(vertcat(ymin{:}));
        lims.ymax = max(vertcat(ymax{:}));

    end

else

    % Check if custom property is specified
    loc_conf_A = struct();
    loc_conf_B = struct();
    typename = fieldnames(pd.config);
    evalIn = [ 'loc_conf_A = pd.config.' typename{1} ';' ];
    eval(evalIn);
    evalIn = [ 'loc_conf_B = pd.config.' typename{2} ';' ];
    eval(evalIn);

    % loc_conf_A.lims
    % loc_conf_B.lims

    if isfield(loc_conf_A, 'lims') & isfield(loc_conf_B, 'lims') & ...
       isfield(loc_conf_A.lims, 'ysc_eq') & isfield(loc_conf_B.lims, 'ysc_eq')

        if loc_conf_A.lims.ysc_eq & loc_conf_B.lims.ysc_eq & ...
            (loc_conf_A.lims.ymin_all < loc_conf_A.lims.ymax_all) & ...
            (loc_conf_B.lims.ymin_all < loc_conf_B.lims.ymax_all)

            % Apply found upper and lower limits for all wells
            lims.ymin = min(loc_conf_A.lims.ymin_all,loc_conf_B.lims.ymin_all);
            lims.ymax = max(loc_conf_A.lims.ymax_all,loc_conf_B.lims.ymax_all);            

        else

            % revert to custom config for limits
            lims.ymin = min(loc_conf_A.lims.ymin,loc_conf_B.lims.ymin);
            lims.ymax = max(loc_conf_A.lims.ymax,loc_conf_B.lims.ymax);

        end

    end

end

% Some slight rescaling
if lims.ymin < lims.ymax*.1
    lims.ymin = 0;
else
    lims.ymin = lims.ymin*.95;
end
lims.ymax = lims.ymax*1.05;

ApplyPlotSettings(fh, ah, th, xlh, ylh, lh, lims);

% File name
file_path = strcat(folder, '/', ... Folder path
   num2str(index), '_', regexprep(lower(pd.title), ' ', '_'), ... File name
   '.pdf'); % Extension

% Save plot
saveas(fh, file_path);
clear cm fh ah th xlh ylh lh;

print_message(file_path);

    function print_message(file_path)
        fprintf('Saved plot: %s\n\n', file_path);
    end

end

