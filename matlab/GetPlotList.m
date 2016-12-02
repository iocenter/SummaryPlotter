function [ plot_list ] = GetPlotList(summary_data,...
	units, config, folder)
%% GETPLOTLIST Checks all plot data and returns a 
% list of datatypes to can be plotted as a cell 
% array of corresponding function handles
% 
% INPUT
% -summary_data: object containing all data 
% for plotting
% 
% -units, config, and folder: see CreateBatchPlots
% 
% OUTPUT
% plot_list: list of datatypes to plot

xdata = summary_data.('FIELD').('TIME');

plot_list = {};

if size(summary_data.FIELD.FPR,1) > 0
    nm = @() fpr(1);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.WELLS.WGPR,1) > 1
%     wgpr(2);
end

if size(summary_data.WELLS.WLPR,1) > 1
    nm = @() wlpr(2);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.WELLS.WOPR,1) > 1
    nm = @() wopr(2);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.WELLS.WWPR,1) > 1
    nm = @() wwpr(2);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.WELLS.WGPT,1) > 1
%     wgpt(3);
end

if size(summary_data.WELLS.WLPT,1) > 1
    nm = @() wlpt(3);
    plot_list = { plot_list{:} nm };  
end

if size(summary_data.WELLS.WOPT,1) > 1
    nm = @() wopt(3);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.WELLS.WWPT,1) > 1
    nm = @() wwpt(3);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.WELLS.WBHP,1) > 1
    nm = @() wbhp(4);
    plot_list = { plot_list{:} nm };  
end

if size(summary_data.WELLS.WWCT,1) > 1
    nm = @() wwct(5);
    plot_list = { plot_list{:} nm };  
end

if size(summary_data.FIELD.FGPR,1) > 0
% fgpr(6);
end

if size(summary_data.FIELD.FLPR,1) > 0
    nm = @() flpr(6);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.FIELD.FOPR,1) > 0
    nm = @() fopr(6);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.FIELD.FWPR,1) > 0
    nm = @() fwpr(6);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.FIELD.FGPR,1) > 0
% fgpt(7);
end

if size(summary_data.FIELD.FLPT,1) > 0
    nm = @() flpt(7);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.FIELD.FOPT,1) > 0
    nm = @() fopt(7);
    plot_list = { plot_list{:} nm };
end

if size(summary_data.FIELD.FWPT,1) > 0
    nm = @() fwpt(7);
    plot_list = { plot_list{:} nm };
end


    function fpr(index)
        datatype = 'FPR';
        pd = PlotData('Average Reservoir Pressure', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);

        smry_data = [summary_data.FIELD.(datatype)];
        pd.set_ydata(smry_data, {datatype}, {'pressure'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype, smry_data);
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fgpr(index)
        datatype = 'FGPR';
        pd = PlotData('Field Gas Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);

        smry_data = [summary_data.FIELD.(datatype)];
        pd.set_ydata(smry_data, {datatype}, {'gas'});        
        pd.set_xdata(xdata);
        pd.set_config(config, datatype, smry_data);
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function flpr(index)
        datatype = 'FLPR';
        pd = PlotData('Field Liquid Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);

        smry_data = [summary_data.FIELD.(datatype)];
        pd.set_ydata(smry_data, {datatype}, {'liquid'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype, smry_data);
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fopr(index)
        datatype = 'FOPR';
        pd = PlotData('Field Oil Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);

        smry_data = [summary_data.FIELD.(datatype)];
        pd.set_ydata(smry_data, {datatype}, {'oil'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype, smry_data);
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fwpr(index)
        datatype = 'FWPR';
        pd = PlotData('Field Water Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);

        smry_data = [summary_data.FIELD.(datatype)];
        pd.set_ydata(smry_data, {datatype}, {'water'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype, smry_data);
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fgpt(index)
        datatype = 'FGPT';
        pd = PlotData('Field Gas Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);

        smry_data = [summary_data.FIELD.(datatype)];
        pd.set_ydata(smry_data, {datatype}, {'gas'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype, smry_data);
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function flpt(index)
        datatype = 'FLPT';
        pd = PlotData('Field Liquid Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);

        smry_data = [summary_data.FIELD.(datatype)];
        pd.set_ydata(smry_data, {datatype}, {'liquid'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype, smry_data);
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fopt(index)
        datatype = 'FOPT';
        pd = PlotData('Field Oil Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);

        smry_data = [summary_data.FIELD.(datatype)];        
        pd.set_ydata(smry_data, {datatype}, {'oil'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype, smry_data);
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fwpt(index)
        datatype = 'FWPT';
        pd = PlotData('Field Water Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);

        smry_data = [summary_data.FIELD.(datatype)];
        pd.set_ydata(smry_data, {datatype}, {'water'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype, smry_data);
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function wgpr(index)
        datatype = 'WGPR';     
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);  
    
        for i=1:well_indices
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Gas Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'gas'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype, ydata_all_wells, well_indices);
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wlpr(index)
        datatype = 'WLPR';
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);

        for i=well_indices
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Liquid Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'liquid'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype, ydata_all_wells, well_indices);
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wopr(index)
        datatype = 'WOPR';
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);  
        
        for i=well_indices
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Oil Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'oil'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype, ydata_all_wells, well_indices);
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wwpr(index)
        datatype = 'WWPR';
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);

        for i=well_indices
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Water Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'water'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype, ydata_all_wells, well_indices);
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wgpt(index)
        datatype = 'WGPT';
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);      
        
        for i=well_indices
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Gas Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'gas'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype, ydata_all_wells, well_indices);
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wlpt(index)
        datatype = 'WLPT';
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);

        for i=well_indices
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Liquid Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'liquid'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype, ydata_all_wells, well_indices);
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wopt(index)
        datatype = 'WOPT';
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);

        for i=well_indices
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Oil Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'oil'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype, ydata_all_wells, well_indices);
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wwpt(index)
        datatype = 'WWPT';
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);

        for i=well_indices
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Water Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'water'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype, ydata_all_wells, well_indices);
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wbhp(index)
        datatype = 'WBHP';
        ydata_all_wells = summary_data.WELLS.(datatype);
        size_ydata_all_wells = size(ydata_all_wells);

        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Well Bottom Hole Pressure, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'pressure'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype, ydata_all_wells);
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wwct(index)
        datatype = 'WWCT';
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);      
        
        for i=well_indices
            wellname = strcat('Well ', num2str(i), ...
                ' [', welltype{i}, ']');
            pd = PlotData(strcat('Well Water Cut, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'water'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype, ydata_all_wells);
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end
    
    % Returns ydata for given datatype, and well_indices
    % vector describing whether well is producer or injector    
    function [well_indices, ydata_all_wells, welltype] = ...
            get_data(summary_data, datatype)
        
        % Select summary data from main structure
        ydata_all_wells = summary_data.WELLS.(datatype);
        sz_ydata = size(ydata_all_wells);
        
        % Find index vector L for injectors(0), producers(1)
        % 
        well_indices = 1 : sz_ydata(2);        
        if isfield(summary_data.WELLS, 'WIDX');
            L = logical(summary_data.WELLS.WIDX);
        else
            L = true(size(well_indices));
        end
        well_indices = well_indices(L);

        % Store welltype
        welltype = cell(1,sz_ydata(2));
        for i=1:size(L,2)
            if L(i)
                welltype{i} = 'producer';
            else
                welltype{i} = 'injector';
            end
        end

    end

end
