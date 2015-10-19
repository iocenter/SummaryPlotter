function output = set_config( obj, config, property )
% SET_CONFIG Saves field corresponding to "name" from custom 
% config structure to current object

if ~isfield(config, property)
    fprintf([ 'The %s property does not have a'...
        'custom configuration, setting it to ' ...
        'default (empty).\n' ], property);
    obj.config = struct();
    % output = false;
else
    evalIn = [ 'obj.config.' property ...
    ' = config.' property ';' ];
    eval(evalIn);
    output = true;
end

return;

end

