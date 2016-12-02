function [] = ApplyPlotSettings( fh, ah, th, xlh, ylh, lh, lims )
%APPLYPLOTSETTINGS Applies the default plot settings and axis values
%   fh = figure handle
%   ah = axes handle
%   th = title handle
%   xlh = xlabel handle
%   ylh = ylabel handle
%   lh = legend handle
%   lims = axis limits. Optional.

properties = PlotProperties();

% Figure settings =========================================================
set(fh, 'PaperPosition', properties.figure.dims.PaperPosition, ...
        'PaperSize', properties.figure.dims.PaperSize);

% Axis settings ===========================================================
set(ah, 'FontName', properties.font.common.FontName, ...
        'FontSize', properties.font.axes.FontSize);
box(ah);
grid(ah);

% Title settings ==========================================================
set(th, 'FontSize', properties.font.title.FontSize, ...
        'FontWeight', properties.font.title.FontWeight);
    
% Axis label settings =====================================================
set(xlh, 'FontSize', properties.font.labels.FontSize, ...
         'FontWeight', properties.font.labels.FontWeight);
set(ylh, 'FontSize', properties.font.labels.FontSize, ...
         'FontWeight', properties.font.labels.FontWeight, 'interpreter', 'tex');

     
% Legend settings =========================================================
set(lh, 'FontSize', properties.font.legend.FontSize);

% Axes scaling ============================================================
if isfield(lims, 'xmin') && isfield(lims, 'xmax')
    lims.xmin = 0;
    set(ah, 'XLim', [lims.xmin, lims.xmax]);
end

if isfield(lims, 'ymin') && isfield(lims, 'ymax')
    set(ah, 'YLim', [lims.ymin, lims.ymax]);
end

end

