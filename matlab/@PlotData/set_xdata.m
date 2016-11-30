function output = set_xdata( obj, data )
%SET_XDATA Sets the xdata field

data_dims = size(data);
if data_dims(1) ~= 1
    fprintf('The x-data array consist of one row.\n');
    output = false;
    return;
end


% Implement nonzero information
obj.xdata = {};

for jj = 1 : size(data,2)

	xdata = data{jj};
	nz_elements = obj.nzydata{jj}{:};

	% obj.xdata{jj} = xdata(nz_elements);
	obj.xdata{jj} = xdata;

end

output = true;
return

end