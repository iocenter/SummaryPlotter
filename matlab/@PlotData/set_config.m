function output = set_config( obj, config, datatype, ydata, varargin )
% SET_CONFIG Saves field corresponding to "name" from custom
% config structure to current object

% if ~isfield(config, datatype)
%     fprintf([ 'The %s property does not have a'...
%         'custom configuration, setting it to ' ...
%         'default (empty).\n' ], datatype);
%     obj.config = struct();
%     % output = false;
% else

if iscell(ydata) && size(ydata, 2)==2

    % Transfer over global attributes to local structure
    evalIn = [ 'obj.config.' datatype '_A = config.' datatype ';' ]; eval(evalIn);
    evalIn = [ 'obj.config.' datatype '_B = config.' datatype ';' ]; eval(evalIn);

    for kk = 1 : size(ydata,2)

        if ~isempty(varargin)
            ydata_{kk} = ydata{1}(:,varargin{1});
        else
            ydata_{kk} = ydata{kk};
        end

    end

    % Add equal yscale data to local lim struct
    evalIn = [ 'obj.config.' datatype  '_A.lims.ymax_all = max(max(ydata_{1}));']; eval(evalIn);
    evalIn = [ 'obj.config.' datatype  '_A.lims.ymin_all = min(min(ydata_{1}));']; eval(evalIn);

    evalIn = [ 'obj.config.' datatype  '_B.lims.ymax_all = max(max(ydata_{2}));']; eval(evalIn);
    evalIn = [ 'obj.config.' datatype  '_B.lims.ymin_all = min(min(ydata_{2}));']; eval(evalIn);

else

    % Transfer over global attributes to local structure
    evalIn = [ 'obj.config.' datatype ' = config.' datatype ';' ];
    eval(evalIn);

    if ~isempty(varargin)
    	ydata_ = ydata(:,varargin{1}(:));
    else
    	ydata_ = ydata;
    end

    % Add equal yscale data to local lim struct
    evalIn = [ 'obj.config.' datatype  '.lims.ymax_all = max(max(ydata_));'];
    eval(evalIn);
    evalIn = [ 'obj.config.' datatype  '.lims.ymin_all = min(min(ydata_));'];
    eval(evalIn);

end

output = true;

% end

return;

end

