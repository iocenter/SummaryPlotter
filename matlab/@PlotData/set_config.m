function output = set_config( obj, config )
%SET_CONFIG Saves field corresponding to "name" from custom 
% config structure to current object

ynames 

if 
if ~isfield(obj.config, config)
    fprintf([ 'The %s property does not '...
        'have a custom configuration.\n' ], config);
    obj.config = {};
    output = false;
else
     = obj.config.(config);
    output = true;
end

return;

end

