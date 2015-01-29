function [ properties ] = SelectSummaryData( summary_data )
%SELECTSUMMARYDATA Allows the user to select the data to be plotted
%   Uses a gui window with checkboxes to allow the user to select
%   which of the available data to plot.

    properties = struct; % Will hold the properties to be plotted
    
    [root_labels, child_labels] = ExtractLabels(summary_data);
    
    % Create figure as root gui element
    fig_height = 800; fig_width = 900;
    x_pos = 50; y_pos = 50;
    fh = figure('Visible','on','Position',[x_pos,y_pos,fig_width,fig_height]);
    
    % Create header label
    uicontrol(fh, 'Style', 'text', ...
        'String', 'Select properties to be plotted.', ...
        'FontWeight', 'bold', ...
        'Position', [25, fig_height-35, 500, 20]);
    
    % Create checkboxes for properties
    width = 150; height = 20; x = 25;
    for i = 1:length(root_labels)
        parent_value = root_labels{i};
        child_struct = getfield(child_labels, parent_value);
        for j = 1:length(child_struct)
            y = fig_height - (j*20+50);
            label = strcat(parent_value, ':', child_struct{j});
            uicontrol(fh, 'Style', 'checkbox', ...
                'String', label, ...
                'Value', 0, 'Position', [x, y, width, height], ...
                'Callback', @checkbox_callback);
        end
        x = x + width + 25;
    end
    
    
    % A button used to close the window.
    uicontrol(fh, 'Style', 'pushbutton', ...
        'String', 'OK', 'Position', [390, 10, 50, 20], ...
        'Callback', @okbutton_callback);
    
    % Wait for the figure to be closed before returning from function
    waitfor(fh);

    % Called when the OK button in the gui is clicked
    function okbutton_callback(source, eventdata, handles)
        close all;
        return;
    end

    % Add or remove the property from the list of properties to be
    % plotted when a checkbox is clicked, depending on the value
    function checkbox_callback(source, eventdata, handles)
        property_name = get(source, 'String');
        value = get(source, 'Value');
        C = strsplit(property_name, ':');
        parent = C{1};
        child = C{2};
        if value == 1
            add_property(parent, child)
        else
            remove_property(parent, child)
        end
    end

    function add_property(parent, child)
        properties.(parent).(child) = summary_data.(parent).(child);
        fprintf('Added %s:%s\n', parent, child);
        return;
    end

    function remove_property(parent, child)
        properties.(parent) = rmfield(properties.(parent), child);
        if isempty(fieldnames(properties.(parent)))
            properties = rmfield(properties, parent);
        end
        fprintf('Removed %s:%s\n', parent, child)
        return;
    end

end

