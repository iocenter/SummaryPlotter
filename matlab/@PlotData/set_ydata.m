function output = set_ydata( obj, data, names, types )
%SET_YDATA Sets the ydata, ynames and ytypes fields

debug_output = false;

data_size = size(data);
names_size = size(names);
types_size = size(types);

if debug_output
    fprintf('[%s] data sizes: ', mfilename);
    fprintf('data_size [%d %d] - ', data_size);
    fprintf('names_size [%d %d] - ', names_size);
    fprintf('types_size [%d %d]\n', types_size);
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

if isempty(find(data,1))

    obj.nzydata = 1 : length(data);

else
    
    obj.nzydata = find(data);

end    

obj.ysets = data_size(1);
obj.ydata = data(obj.nzydata);
obj.ynames = names;
obj.ytypes = types;
output = true;
        
end

