function output = set_ydata( obj, summary_data, names, types, varargin )
%SET_YDATA Sets the ydata, ynames and ytypes fields

nzydata = {};
ysets   = {};
ydata   = {};
ynames  = {};
ytypes  = {};
debug_output = true;

for jj = 1 : size(summary_data, 2)

    if ~isempty(varargin)

        data = summary_data{jj}(:)'

    else

        data = summary_data{jj}.FIELD.(names{1});

    end

    data_size  = size(data);
    names_size = size(names);
    types_size = size(types);

    % Check for exceptions in ydata
    output = CheckYdataExceptions(data_size, ...
        types_size, names_size, data, names, types,...
        debug_output);

    if isempty(find(data,1))

        nzylength{1} = 1 : length(data);
        ydata{jj}   = data(nzylength{1});

    else

        for kk = 1 : size(data,1)

            nzylength{kk} = find(data(kk,:));
            ydata{jj}{kk} = data(nzylength{kk});

        end

    end

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


function output = CheckYdataExceptions(data_size, ...
    types_size, names_size, data, names, types, ...
    debug_output)

output  = true;

if debug_output
    fprintf('[%s] data sizes: ', mfilename);
    fprintf('data_size [%d %d] - ', data_size);
    fprintf('names_size [%d %d] - ', names_size);
    fprintf('types_size [%d %d]\n\n', types_size);
end

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
        fprintf('All types must be either oil, water, gas, liquid or pressure.\n');
        output = false;
        return;
    end
end

end