function output = set_units(obj, unit_set)
%SET_UNITS Sets the unit field
%   Uses the Units struct to get the relevant units.
%   The unit_set parameter may be either 'metric' or 'field'.

if strcmp(unit_set, 'metric') ~= true && strcmp(unit_set, 'field') ~= true
    output = false;
    fprintf('The unit set may be either metric or field.\n');
    return;
end

all_units = Units(); % Get the full unit struct
obj.units = all_units.(unit_set);

output = true;
return;

end

