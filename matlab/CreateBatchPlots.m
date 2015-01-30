function [ ] = CreateBatchPlots( summary_data, units )
%CREATEBATCHPLOTS Batch creation of plots.
%   The summary_data parameter is a struct of the simulation summary data.
%   The units parameter is a struct with mappings from properties to units.

% As user where to save plots
folder = uigetdir('','Select directory to save the plots in');
xdata = summary_data.('FIELD').('TIME');  

fpr(1);
wgpr(2);
wlpr(2);
wopr(2);
wwpr(2);
wgpt(3);
wlpt(3);
wopt(3);
wwpt(3);
wbhp(4);
wwct(5);  
fgpr(6);
flpr(6);
fopr(6);
fwpr(6);
fgpt(7);
flpt(7);
fopt(7);
fwpt(7);

    function fpr(index)
        property = 'FPR';
        pd = PlotData('Average Reservoir Pressure', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_xdata(xdata);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'pressure'});
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fgpr(index)
        property = 'FGPR';
        pd = PlotData('Field Gas Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_xdata(xdata);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'gas'});
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function flpr(index)
        property = 'FLPR';
        pd = PlotData('Field Liquid Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_xdata(xdata);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'liquid'});
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fopr(index)
        property = 'FOPR';
        pd = PlotData('Field Oil Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_xdata(xdata);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'oil'});
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fwpr(index)
        property = 'FWPR';
        pd = PlotData('Field Water Production Rate', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_xdata(xdata);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'water'});
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fgpt(index)
        property = 'FGPT';
        pd = PlotData('Field Gas Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_xdata(xdata);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'gas'});
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function flpt(index)
        property = 'FLPT';
        pd = PlotData('Field Liquid Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_xdata(xdata);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'liquid'});
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fopt(index)
        property = 'FOPT';
        pd = PlotData('Field Oil Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_xdata(xdata);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'oil'});
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function fwpt(index)
        property = 'FWPT';
        pd = PlotData('Field Water Production Total', units);
        pd.set_xlabel('TIME');
        pd.set_ylabel(property);
        pd.set_xdata(xdata);
        pd.set_ydata([summary_data.FIELD.(property)], {property}, {'water'});
        CreatePlot(pd, folder, index);
        clear pd;
    end

    function wgpr(index)
        property = 'WGPR';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Gas Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_xdata(xdata);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'gas'});
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wlpr(index)
        property = 'WLPR';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Liquid Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_xdata(xdata);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'liquid'});
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wopr(index)
        property = 'WOPR';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Oil Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_xdata(xdata);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'oil'});
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wwpr(index)
        property = 'WWPR';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Water Production Rate, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_xdata(xdata);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'water'});
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wgpt(index)
        property = 'WGPT';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Gas Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_xdata(xdata);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'gas'});
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wlpt(index)
        property = 'WLPT';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Liquid Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_xdata(xdata);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'liquid'});
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wopt(index)
        property = 'WOPT';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Oil Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_xdata(xdata);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'oil'});
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wwpt(index)
        property = 'WWPT';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Water Production Total, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_xdata(xdata);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'water'});
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wbhp(index)
        property = 'WBHP';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Well Bottom Hole Pressure, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_xdata(xdata);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'pressure'});
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end

    function wwct(index)
        property = 'WWCT';
        ydata_all_wells = summary_data.WELLS.(property);
        size_ydata_all_wells = size(ydata_all_wells);
        for i=1:size_ydata_all_wells(2)
            wellname = strcat('Well ', num2str(i));
            pd = PlotData(strcat('Well Water Cut, ', wellname), units);
            pd.set_xlabel('TIME');
            pd.set_ylabel(property);
            pd.set_xdata(xdata);
            pd.set_ydata(ydata_all_wells(:,i)', {property}, {'water'});
            CreatePlot(pd, folder, index);
            clear pd;
        end
    end
    
end

