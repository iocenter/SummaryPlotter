function [ plot_list ] = GetPlotListMult(summary_data,...
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

mdata = size(summary_data, 2) == 1;

if mdata

    xdata = { summary_data{1}.('FIELD').('TIME') };

else

    xdata = { ...
    summary_data{1}.('FIELD').('TIME'), ...
    summary_data{2}.('FIELD').('TIME') };

end

plot_list = {};

if (size(summary_data{1}.FIELD.FPR,1) > 0) ...
    && (size(summary_data{2}.FIELD.FPR,1) > 0)
    nm = @() fpr(1);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.WELLS.WGPR,1) > 1) ...
    && (size(summary_data{2}.WELLS.WGPR,1) > 1)
%     wgpr(2);
end

if (size(summary_data{1}.WELLS.WLPR,1) > 1) ...
    && (size(summary_data{2}.WELLS.WLPR,1) > 1)
    nm = @() wlpr(2);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.WELLS.WOPR,1) > 1) ...
    && (size(summary_data{2}.WELLS.WOPR,1) > 1)
    nm = @() wopr(2);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.WELLS.WWPR,1) > 1) ...
    && (size(summary_data{2}.WELLS.WWPR,1) > 1)
    nm = @() wwpr(2);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.WELLS.WGPT,1) > 1) ...
    && (size(summary_data{2}.WELLS.WGPT,1) > 1)
%     wgpt(3);
end

if (size(summary_data{1}.WELLS.WLPT,1) > 1) ...
    && (size(summary_data{2}.WELLS.WLPT,1) > 1)
    nm = @() wlpt(3);
    plot_list = { plot_list{:} nm };  
end

if (size(summary_data{1}.WELLS.WOPT,1) > 1) ...
    && (size(summary_data{2}.WELLS.WOPT,1) > 1)
    nm = @() wopt(3);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.WELLS.WWPT,1) > 1) ...
    && (size(summary_data{2}.WELLS.WWPT,1) > 1)
    nm = @() wwpt(3);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.WELLS.WBHP,1) > 1) ...
    && (size(summary_data{2}.WELLS.WBHP,1) > 1)
    nm = @() wbhp(4);
    plot_list = { plot_list{:} nm };  
end

if (size(summary_data{1}.WELLS.WWCT,1) > 1) ...
    && (size(summary_data{2}.WELLS.WWCT,1) > 1)
    nm = @() wwct(5);
    plot_list = { plot_list{:} nm };  
end

if (size(summary_data{1}.FIELD.FGPR,1) > 0) ...
    && (size(summary_data{2}.FIELD.FGPR,1) > 0)
% fgpr(6);
end

if (size(summary_data{1}.FIELD.FLPR,1) > 0) ...
    && (size(summary_data{2}.FIELD.FLPR,1) > 0)
    nm = @() flpr(6);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.FIELD.FOPR,1) > 0) ...
    && (size(summary_data{2}.FIELD.FOPR,1) > 0)
    nm = @() fopr(6);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.FIELD.FWPR,1) > 0) ...
    && (size(summary_data{2}.FIELD.FWPR,1) > 0)
    nm = @() fwpr(6);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.FIELD.FGPR,1) > 0) ...
    && (size(summary_data{2}.FIELD.FGPR,1) > 0)
% fgpt(7);
end

if (size(summary_data{1}.FIELD.FLPT,1) > 0) ...
    && (size(summary_data{2}.FIELD.FLPT,1) > 0)
    nm = @() flpt(7);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.FIELD.FOPT,1) > 1) ...
    && (size(summary_data{2}.FIELD.FOPT,1) > 1)
    nm = @() fopt(7);
    plot_list = { plot_list{:} nm };
end

if (size(summary_data{1}.FIELD.FWPT,1) > 1) ...
    && (size(summary_data{2}.FIELD.FWPT,1) > 1)
    nm = @() fwpt(7);
    plot_list = { plot_list{:} nm };
end


    function fpr(index)
        lims = struct; % Will be filled by CreatePlot function
        datatype = 'FPR';
        pd = PlotData('Average Reservoir Pressure', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);
        pd.set_ydata(summary_data, {datatype}, {'pressure'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fgpr(index)
        lims = struct; % Will be filled by CreatePlot function
        datatype = 'FGPR';
        pd = PlotData('Field Gas Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);

        pd.set_ydata(summary_data, {datatype}, {'gas'});        
        pd.set_xdata(xdata);
        pd.set_config(config, datatype);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function flpr(index)
        lims = struct; % Will be filled by CreatePlot function
        datatype = 'FLPR';
        pd = PlotData('Field Liquid Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);
        pd.set_ydata(summary_data, {datatype}, {'liquid'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fopr(index)
        lims = struct; % Will be filled by CreatePlot function
        datatype = 'FOPR';
        pd = PlotData('Field Oil Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);
        pd.set_ydata(summary_data, {datatype}, {'oil'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fwpr(index)
        lims = struct; % Will be filled by CreatePlot function
        datatype = 'FWPR';
        pd = PlotData('Field Water Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);
        pd.set_ydata(summary_data, {datatype}, {'water'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fgpt(index)
        lims = struct; % Will be filled by CreatePlot function
        datatype = 'FGPT';
        pd = PlotData('Field Gas Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);
        pd.set_ydata(summary_data, {datatype}, {'gas'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function flpt(index)
        lims = struct; % Will be filled by CreatePlot function
        datatype = 'FLPT';
        pd = PlotData('Field Liquid Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);
        pd.set_ydata(summary_data, {datatype}, {'liquid'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fopt(index)
        lims = struct; % Will be filled by CreatePlot function
        datatype = 'FOPT';
        pd = PlotData('Field Oil Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);
        pd.set_ydata(summary_data, {datatype}, {'oil'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function fwpt(index)
        lims = struct; % Will be filled by CreatePlot function
        datatype = 'FWPT';
        pd = PlotData('Field Water Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(datatype);
        pd.set_ydata(summary_data, {datatype}, {'water'});
        pd.set_xdata(xdata);
        pd.set_config(config, datatype);
        CreatePlot(pd, folder, index, lims);
        clear pd;
    end

    function wgpr(index)
        datatype = 'WGPR';
        
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);  
    
        lims.ymin = min(min(vertcat(ydata_all_wells{:})));
        lims.ymax = max(max(vertcat(ydata_all_wells{:})));

        for i=well_indices{1}
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Gas Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'gas'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wlpr(index)
        datatype = 'WLPR';

        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);  

        lims.ymin = min(min(vertcat(ydata_all_wells{:})));
        lims.ymax = max(max(vertcat(ydata_all_wells{:})));

        for i=1:size(ydata_all_wells{1},2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Liquid Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);

            for jj = 1 : size(ydata_all_wells,2);
                data{jj} = ydata_all_wells{jj}(:,i)';
            end

            pd.set_ydata(data, {datatype}, {'liquid'},'well');
            pd.set_xdata(xdata);
            pd.set_config(config, datatype);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wopr(index)
        datatype = 'WOPR';
        
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);  
        
        lims.ymin = min(min(vertcat(ydata_all_wells{:})));
        lims.ymax = max(max(vertcat(ydata_all_wells{:})));

        for i=well_indices{1}
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Oil Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'oil'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wwpr(index)
        datatype = 'WWPR';

        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);

        lims.ymin = min(min(vertcat(ydata_all_wells{:})));
        lims.ymax = max(max(vertcat(ydata_all_wells{:})));

        for i=1:size(ydata_all_wells{1},2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Water Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'water'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wgpt(index)
        datatype = 'WGPT';
        
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);      
        
        lims.ymin = min(min(vertcat(ydata_all_wells{:})));
        lims.ymax = max(max(vertcat(ydata_all_wells{:})));

        for i=well_indices{1}
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Gas Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'gas'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wlpt(index)
        datatype = 'WLPT';

        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);

        lims.ymin = min(min(vertcat(ydata_all_wells{:})));
        lims.ymax = max(max(vertcat(ydata_all_wells{:})));

        for i=1:size(ydata_all_wells{1},2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Liquid Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'liquid'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wopt(index)
        datatype = 'WOPT';
        
        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);

        lims.ymin = min(min(vertcat(ydata_all_wells{:})));
        lims.ymax = max(max(vertcat(ydata_all_wells{:})));

        for i=well_indices{1}
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Oil Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'oil'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wwpt(index)
        datatype = 'WWPT';

        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);

        lims.ymin = min(min(vertcat(ydata_all_wells{:})));
        lims.ymax = max(max(vertcat(ydata_all_wells{:})));

        for i=1:size(ydata_all_wells{1},2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Water Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'water'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wbhp(index)
        datatype = 'WBHP';

        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);

        lims.ymin = min(min(vertcat(ydata_all_wells{:})));
        lims.ymax = max(max(vertcat(ydata_all_wells{:})));

        for i=1:size(ydata_all_wells{1},2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Well Bottom Hole Pressure, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'pressure'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end

    function wwct(index)
        datatype = 'WWCT';

        [well_indices, ydata_all_wells, welltype] = ...
        get_data(summary_data, datatype);      
        
        lims.ymin = min(min(vertcat(ydata_all_wells{:})));
        lims.ymax = max(max(vertcat(ydata_all_wells{:})));

        for i=well_indices{1}
            wellname = strcat('Well ', num2str(i), ...
                ' [', welltype{i}, ']');
            pd = PlotData(strcat('Well Water Cut, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(datatype);
            pd.set_ydata(ydata_all_wells(:,i)', {datatype}, {'water'});
            pd.set_xdata(xdata);
            pd.set_config(config, datatype);
            CreatePlot(pd, folder, index, lims);
            clear pd;
        end
    end
    
    % Returns ydata for given datatype, and well_indices
    % vector describing whether well is producer or injector    
    function [well_indices, ydata_all_wells, welltype] = ...
            get_data(summary_data, datatype)
        
        % Select summary data from main structure
        ydata_all_wells = {};
        sz_ydata        = {};
        well_indices    = {};
        welltype        = {};

        for jj = 1 : size(summary_data,2)

            ydata_all_wells{jj} = summary_data{jj}.WELLS.(datatype);
            sz_ydata{jj} = size(ydata_all_wells{jj});

            % Find index vector L for injectors(0), producers(1)
            well_indices{jj} = 1 : sz_ydata{jj}(2);

            if isfield(summary_data{jj}.WELLS, 'WIDX');
                L = logical(summary_data{jj}.WELLS.WIDX);
            else
                L = true(size(well_indices{jj}));
            end

            well_indices{jj} = well_indices{jj}(L);

            % Store welltype
            welltype{jj} = cell(1,sz_ydata{jj}(2));
            for ii = 1 : size(L,2)
                if L(ii)
                    welltype{jj}{ii} = 'producer';
                else
                    welltype{jj}{ii} = 'injector';
                end
            end

        end

    end % end get_data function

end
