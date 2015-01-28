function [ figure_handle ] = CreatePlot( properties )
%CREATEPLOT Create a plot of the input properties.
%   Returns a figure handle with a plot of the input properties.
%   The figure is initially hidden. It may be shown by calling "shg".

figure_handle = figure('Visible','off');
x = 1:1:10;
y = sin(x);
plot(x,y);

end

