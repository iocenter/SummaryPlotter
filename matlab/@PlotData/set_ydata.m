function output = set_ydata( obj, smry_data, names, types, varargin )
%SET_YDATA Sets the ydata, ynames and ytypes fields

nzydata = {};
ysets   = {};
ydata   = {};
ynames  = {};
ytypes  = {};
debug_output = true;

if debug_output
    fprintf('[%s] pd data: ', mfilename);
    fprintf('size of smry_data: [%d %d] - ', size(smry_data));
end

if ~iscell(smry_data)

    n_cols = 1;
    fprintf('data is NOT cell\n');

else
    
    n_cols = size(smry_data, 2);
    fprintf('data IS cell\n');

end
    

for jj = 1 : n_cols

    if ~iscell(smry_data)

        data = smry_data';

    else
        
        data = smry_data{jj};

    end

    data_size  = size(data);
    names_size = size(names);
    types_size = size(types);

    % Check for exceptions in ydata
    output = CheckYdataExceptions(data_size, ...
        types_size, names_size, data, names, types,...
        debug_output);

    nzylength{1} = 1 : length(data);
    ydata{jj} = data;

    % if isempty(find(data,1))

    %     fprintf([ '[isempty(find(data,1))] is TRUE, i.e.,' ...
    %      'all componentns in data vector are zero!!!\n']);
    %     nzylength{1} = 1 : length(data);
    %     ydata{jj}   = { data(nzylength{1}) };

    % else

    %     fprintf(['[isempty(find(data,1))] is FALSE, i.e.,' ...
    %      'some componentns in data vector are nonzero\n']);
    %     for kk = 1 : size(data,1)

    %         nzylength{kk} = find(data(kk,:));
    %         ydata{jj}(kk) = data(nzylength{kk});

    %     end

    % end

    % ydata

    nzydata{jj} = nzylength;
    ysets{jj}   = data_size(1);
    ynames{jj}  = names;
    ytypes{jj}  = types;

end

obj.nzydata = nzydata;
obj.ysets   = ysets;  
obj.ydata   = ydata;  
obj.ynames  = ynames; 
obj.ytypes  = ytypes; 

end


% ------------------------------------------------------------
function output = CheckYdataExceptions(data_size, ...
    types_size, names_size, data, names, types, ...
    debug_output)

    output  = true;

    if debug_output
        fprintf('[%s] data sizes: ', mfilename);
        fprintf('data_size [%d %d] - ', data_size);
        fprintf('names_size [%d %d] - ', names_size);
        fprintf('types_size [%d %d] -- ', types_size);
    end

    if debug_output

        fprintf('name: [%s] ', names{:});

    end
    fprintf('\n');


    if names_size(2) ~= data_size(1) || types_size(2) ~= data_size(1)
        fprintf('The number of columns in names and types must ');
        fprintf('be the same as the number of rows in data.\n');
        output = false;
        return;
    elseif isempty(data) || isempty(names) || isempty(types)
        fprintf('data, names and types must all be non-empty.\n');
        output = false;
        return;
    elseif ~iscell(names) || ~iscell(types) || iscell(data)
        fprintf('names and types must be cell arrays; data must be an array\n.');
        output = false;
        return;
    end

    for i=1:types_size(2)
        if ~strcmp(types{i}, 'oil') && ...
                ~strcmp(types{i}, 'water') && ... 
                ~strcmp(types{i}, 'gas') && ... 
                ~strcmp(types{i}, 'liquid') && ...
                ~strcmp(types{i}, 'pressure')
            fprintf(['All types must be either oil, water, '...
                'gas, liquid or pressure.\n']);
            output = false;
            return;
        end
    end

end