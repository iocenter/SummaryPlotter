classdef PlotData < handle
    %PLOTDATA Class containing data used to create plots.
    %   Contains the data used to create a plot and set-functions
    %   for populating the fields.
    
    properties (SetAccess = private, GetAccess = public)
        title    % Plot title
        xlabel   % x-axis label
        ylabel   % y-axis label. Using method.
        xdata    % 1D array of data for the x-axis
        ydata    % 1-2D array of data for y-axis. 1 row = 1 data set
        nzydata  % vector of nonzero ydata elements
        ysets    % Number of y data vectors
        ynames   % 1D cell array of data set names. E.g. FOPR, WBHP etc. Lenght must be equal to number of rows in ydata.
        ytypes   % 1D cell array of fluid types for the data sets. E.g. oil, water, gas, fluid. Length must be equal to number of rows in ydata.
        units    % Contains the relevant part of the Units struct. E.g. Units().('metric')

        datatype % Specifies the type of data being plotted, e.g., FOPT
        datatag  % Tag to differentiate b/e FIELD and WELL data entering function
        config   % Struct var containing custom plot configuration for each data type
    end
    
    properties (SetAccess = public, GetAccess = public)
       
        
    end
    
    methods
        function obj = PlotData(title, units) % Constructor. Sets the title and units
            if ~obj.set_units(units)
                fprintf('Error setting units, returning.\n');
                return;
            end
            obj.title = title;
        end
        set_xlabel = set_xlabel(obj, name)
        set_ylabel = set_ylabel(obj, name)
        set_xdata = set_xdata(obj, data)
        set_ydata = set_ydata(obj, data, names, types, datatag)
        set_config = set_config(obj, config, datatype)
        
    end
    
    methods (Access = private)
        set_units = set_units(obj, unit_set);
    end
    
end
    