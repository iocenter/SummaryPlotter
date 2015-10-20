function output = set_ylabel( obj, name )
%SET_YLABEL Sets the y-label for a plot given a property name.
%   Creates a string and stores it in the xlabel field.
%   The unit for the property is retrieved from the units field.
%   The string is on the form "name [unit]"

if ~isfield(obj.units, name)
    fprintf('The %s property does not have a specified unit.\n', name);
    obj.ylabel = name;
    output = false;
else
    unit = obj.units.(name);
    obj.ylabel = strcat(name, ' [', unit, ']');
    obj.datatype = name;
    output = true;
end

return;

end

