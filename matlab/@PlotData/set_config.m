function output = set_config( obj, config, datatype, ydata, iwell, varargin )
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

	% example:
    % data{jj} = ydata_all_wells{jj}(:,i)';

    for kk = 1 : size(ydata,2)

        if ~isempty(varargin)

        	well_indices=varargin{1};

        	% if current idx i corresponds to a producer
        	if any(well_indices.idx_prod{kk}==iwell) 
        		% use only producer data to compute ymin/ymax
	            ydata_{kk} = ydata{kk}(:,well_indices.idx_prod{kk});
	        else
	        	% use only injector data to compute ymin/ymax
	        	ydata_{kk} = ydata{kk}(:,well_indices.idx_inj{kk});
	        end

        else
            ydata_{kk} = ydata{kk};
        end

    end

	% ymax_all = max(max(max(ydata_{1})),max(max(ydata_{2})))
	% ymin_all = min(min(min(ydata_{1})),min(min(ydata_{2})));

    % Add equal yscale data to local lim struct
    evalIn = [ 'obj.config.' datatype  '_A.lims.ymin_all = min(min(ydata_{1}));']; eval(evalIn);
    evalIn = [ 'obj.config.' datatype  '_A.lims.ymax_all = max(max(ydata_{1}));']; eval(evalIn);

    evalIn = [ 'obj.config.' datatype  '_B.lims.ymin_all = min(min(ydata_{2}));']; eval(evalIn);
    evalIn = [ 'obj.config.' datatype  '_B.lims.ymax_all = max(max(ydata_{2}));']; eval(evalIn);

% ydata_{1}

% 	max(max(ydata_{1}))
% 	min(min(ydata_{1}))

% ydata_{2}

% 	max(max(ydata_{2}))
% 	min(min(ydata_{2}))

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

