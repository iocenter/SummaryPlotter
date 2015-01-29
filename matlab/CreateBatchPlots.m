function [ ] = CreateBatchPlots( summary_data )
%CREATEBATCHPLOTS Summary of this function goes here
    properties = PlotProperties();
    % Test data
    x = [0:.01:2*pi];
    y1 = sin(x);
    y2 = 2 .* y1;
    y3 = .5 .* y1;
    y = [y1; y2; y3];
    
    fh = figure('Visible', 'off');
    ah = axes();
    th = title('This is a test plot');
    
    % Setting axis labels and settings
    xlh = xlabel(ah, 'Xlabel [unit]');
    ylh = ylabel(ah, 'YLabel [unit]');
    
    
    
    % Plotting the data
    hold on;
    legend_strings = {};
    for i=1:3
        p = plot(x, y(i,:));
        set(p, 'LineWidth', properties.line.style.LineWidth);
        set(p, 'Color', properties.line.style.Color.oil{i});
        legend_strings{i} = num2str(i);
    end
    legend(legend_strings);
    
    
    
    ApplyPlotSettings(fh, ah, th, xlh, ylh);
    saveas(fh, 'test.pdf');
    
end

