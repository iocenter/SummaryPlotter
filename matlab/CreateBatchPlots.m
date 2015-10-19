function [ ] = CreateBatchPlots( summary_data, ...
    units, config, folder )
%CREATEBATCHPLOTS Batch creation of plots.
%   The summary_data parameter is a struct of the 
%   simulation summary data.
%   The units parameter is a struct with mappings 
%   from properties to units.

% Ask user where to save plots
if isempty(folder)
    folder = uigetdir('','Select directory to save the plots in');
end

xdata = summary_data.('FIELD').('TIME');

if isunix
    [status,cmdout] = system(['cd ' folder '; rm -f *.pdf ;']);
end

if size(summary_data.FIELD.FPR,1) > 0
    fpr(1);
end

if size(summary_data.WELLS.WGPR,1) > 1
%     wgpr(2);
end

if size(summary_data.WELLS.WLPR,1) > 1
    wlpr(2);
end

if size(summary_data.WELLS.WOPR,1) > 1
    wopr(2);
end

if size(summary_data.WELLS.WWPR,1) > 1
    wwpr(2);
end

if size(summary_data.WELLS.WGPT,1) > 1
%     wgpt(3);
end

if size(summary_data.WELLS.WLPT,1) > 1
    wlpt(3);
end

if size(summary_data.WELLS.WOPT,1) > 1
    wopt(3);
end

if size(summary_data.WELLS.WWPT,1) > 1
    wwpt(3);
end

if size(summary_data.WELLS.WBHP,1) > 1
    wbhp(4);
end

if size(summary_data.WELLS.WWCT,1) > 1
    wwct(5);  
end

if size(summary_data.FIELD.FGPR,1) > 0
% fgpr(6);
end

if size(summary_data.FIELD.FLPR,1) > 0
flpr(6);
end

if size(summary_data.FIELD.FOPR,1) > 0
fopr(6);
end

if size(summary_data.FIELD.FWPR,1) > 0
fwpr(6);
end

if size(summary_data.FIELD.FGPR,1) > 0
% fgpt(7);
end

if size(summary_data.FIELD.FLPT,1) > 0
flpt(7);
end

if size(summary_data.FIELD.FOPT,1) > 1
fopt(7);
end

if size(summary_data.FIELD.FWPT,1) > 1
fwpt(7);
end

if isunix
    output_file = 'all_graphs.pdf';
    system(['cd ' folder '; pwd; rm -f ' output_file ';']);
    system(['cd ' folder '; pdftk *.pdf output ' output_file ';']);
end

    function fpr(index)
        lims = struct; % Will be filled by CreatePlot function
        property = 'FPR';
        pd = PlotData('Average Reservoir Pressure', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'pressure'});
        pd.set_xdata(xdata);
        pd.set_config(config, property);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fgpr(index)
        lims = struct; % Will be filled by CreatePlot function
        property = 'FGPR';
        pd = PlotData('Field Gas Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'gas'});        
        pd.set_xdata(xdata);
        pd.set_config(config, property);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function flpr(index)
        lims = struct; % Will be filled by CreatePlot function
        property = 'FLPR';
        pd = PlotData('Field Liquid Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'liquid'});
        pd.set_xdata(xdata);
        pd.set_config(config, property);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fopr(index)
        lims = struct; % Will be filled by CreatePlot function
        property = 'FOPR';
        pd = PlotData('Field Oil Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'oil'});
        pd.set_xdata(xdata);
        pd.set_config(config, property);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fwpr(index)
        lims = struct; % Will be filled by CreatePlot function
        property = 'FWPR';
        pd = PlotData('Field Water Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'water'});
        pd.set_xdata(xdata);
        pd.set_config(config, property);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fgpt(index)
        lims = struct; % Will be filled by CreatePlot function
        property = 'FGPT';
        pd = PlotData('Field Gas Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'gas'});
        pd.set_xdata(xdata);
        pd.set_config(config, property);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function flpt(index)
        lims = struct; % Will be filled by CreatePlot function
        property = 'FLPT';
        pd = PlotData('Field Liquid Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'liquid'});
        pd.set_xdata(xdata);
        pd.set_config(config, property);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fopt(index)
        lims = struct; % Will be filled by CreatePlot function
        property = 'FOPT';
        pd = PlotData('Field Oil Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'oil'});
        pd.set_xdata(xdata);
        pd.set_config(config, property);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fwpt(index)
        lims = struct; % Will be filled by CreatePlot function
        property = 'FWPT';
        pd = PlotData('Field Water Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'water'});
        pd.set_xdata(xdata);
        pd.set_config(config, property);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function wgpr(index)
        property = 'WGPR';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        lims.ymin = min(min(ydata_all_wells));
        lims.ymax = max(max(ydata_all_wells));
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Gas Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'gas'});
            pd.set_xdata(xdata);
            pd.set_config(config, property);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wlpr(index)
        property = 'WLPR';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        lims.ymin = min(min(ydata_all_wells));
        lims.ymax = max(max(ydata_all_wells));
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Liquid Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'liquid'});
            pd.set_xdata(xdata);
            pd.set_config(config, property);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wopr(index)
        property = 'WOPR';
        ydata_all_wells = summary_data.WELLS.(property);

        well_indices = 1 : size(ydata_all_wells,2);
        if isfield(summary_data.WELLS, 'WIDX');
            L = logical(summary_data.WELLS.WIDX);
            well_indices = well_indices(L);
        end
        
        lims.ymin = min(min(ydata_all_wells));
        lims.ymax = max(max(ydata_all_wells));
        for i=well_indices
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Oil Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'oil'});
            pd.set_xdata(xdata);
            pd.set_config(config, property);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wwpr(index)
        property = 'WWPR';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        lims.ymin = min(min(ydata_all_wells));
        lims.ymax = max(max(ydata_all_wells));
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Water Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'water'});
            pd.set_xdata(xdata);
            pd.set_config(config, property);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wgpt(index)
        property = 'WGPT';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        lims.ymin = min(min(ydata_all_wells));
        lims.ymax = max(max(ydata_all_wells));
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Gas Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'gas'});
            pd.set_xdata(xdata);
            pd.set_config(config, property);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wlpt(index)
        property = 'WLPT';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        lims.ymin = min(min(ydata_all_wells));
        lims.ymax = max(max(ydata_all_wells));
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Liquid Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'liquid'});
            pd.set_xdata(xdata);
            pd.set_config(config, property);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wopt(index)
        property = 'WOPT';
        ydata_all_wells = summary_data.WELLS.(property);

        well_indices = 1 : size(ydata_all_wells,2);
        if isfield(summary_data.WELLS, 'WIDX');
            L = logical(summary_data.WELLS.WIDX);
            well_indices = well_indices(L);
        end

        lims.ymin = min(min(ydata_all_wells));
        lims.ymax = max(max(ydata_all_wells));
        for i=1:well_indices
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Oil Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'oil'});
            pd.set_xdata(xdata);
            pd.set_config(config, property);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wwpt(index)
        property = 'WWPT';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        lims.ymin = min(min(ydata_all_wells));
        lims.ymax = max(max(ydata_all_wells));
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Water Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'water'});
            pd.set_xdata(xdata);
            pd.set_config(config, property);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wbhp(index)
        property = 'WBHP';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        lims.ymin = min(min(ydata_all_wells));
        lims.ymax = max(max(ydata_all_wells));
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Well Bottom Hole Pressure, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'pressure'});
            pd.set_xdata(xdata);
            pd.set_config(config, property);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wwct(index)
        property = 'WWCT';
        ydata_all_wells = summary_data.WELLS.(property);
        
        well_indices = 1 : size(ydata_all_wells,2);
        if isfield(summary_data.WELLS, 'WIDX');
            L = logical(summary_data.WELLS.WIDX);
            well_indices = well_indices(L);
        end
        
        lims.ymin = min(min(ydata_all_wells));
        lims.ymax = max(max(ydata_all_wells));
        for i=well_indices
            if L(i); welltype = ' (producer)'; 
            else welltype = ' (injector)'; end
            wellname = strcat('Well ', num2str(i), welltype);
            pd = PlotData(strcat('Well Water Cut, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'water'});
            pd.set_xdata(xdata);
            pd.set_config(config, property);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end
    
    function well_indices = get_well_indices(ydata_all_wells, summary_data)

    end

end

