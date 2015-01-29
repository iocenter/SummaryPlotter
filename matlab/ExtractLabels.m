function [ root_labels, leaf_labels ] = ExtractLabels( summary_data )
%EXTRACTLABELS Extract labels from a struct of simulation summray data
%   Returns two cell arrays containing root and leaf labels for the 
%   simulation data. Root labels are the data category (FIELD, WELL, etc.).
%   Leaf labels are the specific data labels (FOPR, WOPT, etc.)

    % Get root field names from summary data
    root_labels = fieldnames(summary_data);
    
    % Create and populate structure with all child field names
    leaf_labels = struct;
    for i = 1:length(root_labels)
        tmp = fieldnames(getfield(summary_data, root_labels{i}));
        leaf_labels.(root_labels{i}) = tmp;
    end  
end

