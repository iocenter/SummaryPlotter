classdef ColorMapper < handle
    %COLORMAPPER Class containing colors. Returns next color for fluid
    %type.
    
    properties
    end
    
    properties (Access = private)
        all_colors
        next
    end
    
    methods
        function obj = ColorMapper() % Constructor
            obj.next.oil = 1;
            obj.next.gas = 1;
            obj.next.water = 1;
            obj.next.liquid = 1;
            obj.next.pressure = 1;
            obj.all_colors = obj.colors();
            return;
        end
        
        function next_color = get_next(obj, type)
            next_color = obj.all_colors.(type){obj.next.(type)};
            obj.next.(type) = obj.next.(type) + 1;
            if obj.next.(type) > 4
                obj.next.(type) = 1;
            end
            return;
        end
    end
    
    methods (Access = private)
        colors = colors(obj)
    end
    
end

