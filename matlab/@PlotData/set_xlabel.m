function output = set_xlabel(obj, name )
%SET_XLABEL Sets the x-label for a plot given a property name.
%   Creates a string and stores it in the xlabel field.
%   The unit for the property is retrieved from the units field.
%   The string is on the form "name [unit]"

if ~isfield(obj.units, name)
    fprintf('The %s property does not have a specified unit.\n', name);
    obj.xlabel = name;
    output = false;
else
    unit = obj.units.(name);
    obj.xlabel = strcat(name, ' [', unit, ']');
    output = true;
end

return;

end

