function output = set_xdata( obj, data )
%SET_XDATA Sets the xdata field

data_dims = size(data);
if data_dims(1) ~= 1
    fprintf('The x-data array consist of one row.\n');
    output = false;
    return;
end

obj.xdata = data;
output = true;
return


end

