function output = set_config( obj, config, datatype )
% SET_CONFIG Saves field corresponding to "name" from custom 
% config structure to current object

if ~isfield(config, datatype)
    fprintf([ 'The %s property does not have a'...
        'custom configuration, setting it to ' ...
        'default (empty).\n' ], datatype);
    obj.config = struct();
    % output = false;
else
    evalIn = [ 'obj.config.' datatype ...
    ' = config.' datatype ';' ];
    eval(evalIn);
    output = true;
end

return;

end

