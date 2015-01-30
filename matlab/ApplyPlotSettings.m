function [] = ApplyPlotSettings( fh, ah, th, xlh, ylh, lh )
%APPLYPLOTSETTINGS Summary of this function goes here
%   Detailed explanation goes here

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
         'FontWeight', properties.font.labels.FontWeight);

     
% Legend settings =========================================================
set(lh, 'FontSize', properties.font.legend.FontSize);

end

