function [ figure_handle ] = CreatePlot( properties )
%CREATEPLOT Create a plot of the input properties.
%   Returns a figure handle with a plot of the input properties and 
%   controls to save the plot/plot data.
%   The figure is initially hidden. It may be shown by calling "shg".
    
    % Figure window size and position variables
    fig_width = 900; fig_height = 500;
    x_pos = 50; y_pos = 50;
    
    % Create figure and axes
    figure_handle = figure('Visible', 'off', ...
        'Position',[x_pos,y_pos,fig_width,fig_height]);
    axes_handle =  axes('Units', 'pixels', ...
        'Position', [50,40,fig_width-200, fig_height-50]);
    
    % Plot the data
    hold on;
    colors = ['m', 'c', 'r', 'g', 'b', 'k'];
    [root_labels, leaf_labels] = ExtractLabels(properties);
    legend_strings = {};
    line_nr = 1;
    for i = 1:length(root_labels)
        root_label = root_labels{i};
        for j = 1:length(leaf_labels.(root_label))
            leaf_label = leaf_labels.(root_label){j}'
            plot(properties.(root_label).(leaf_label), colors(line_nr));
            legend_strings{line_nr} = leaf_label;
            line_nr = line_nr + 1;
            if line_nr > 6
                fprintf('Unable to plot more than 6 lines.\n')
                break;
            end
        end
    end
    legend(legend_strings);

    % Button size and position variables
    btn_width = 100; btn_height = 25;
    btn_x = fig_width-btn_width-15;
    
    % Button used to close the window.
    uicontrol(figure_handle, 'Style', 'pushbutton', ...
        'String', 'Close', ...
        'Position', [btn_x, 10, btn_width, btn_height], ...
        'Callback', @closebutton_callback);
    
    % Button used to save the plot as pdf
    uicontrol(figure_handle, 'Style', 'pushbutton', ...
        'String', 'Save as PDF', ...
        'Position', [btn_x, 175, btn_width, btn_height], ...
        'Callback', @savepdfbutton_callback);
    
    % Button used to save the plotted data to a csv file
    uicontrol(figure_handle, 'Style', 'pushbutton', ...
        'String', 'Save to CSV', ...
        'Position', [btn_x, 150, btn_width, btn_height], ...
        'Callback', @savecsvbutton_callback);

    shg; % SHOW FIGURE
    
    % Wait for the figure to be closed before returning from function
    waitfor(figure_handle);
    
    
    function closebutton_callback(source, eventdata, handles)
        close all;
        return;
    end

    function savepdfbutton_callback(source, eventdata, handles)
        fprintf('Clicked Save PDF button.\n');
    end

    function savecsvbutton_callback(source, eventdata, handles)
        fprintf('Clicked Save CSV button.\n');
    end

end

