function updatePlots(handle, geneHandle, distHandle, start, stop, locations, path, pop, minDist, gen)
    set(handle.start, 'xdata', start.x, 'ydata', start.y);
    set(handle.stop, 'xdata', stop.x, 'ydata', stop.y);
    set(handle.locations, 'xdata', locations.x, 'ydata', locations.y);
    set(handle.path, 'xdata', path.x, 'ydata', path.y);
    set(geneHandle, 'cdata', pop);
%     set(distHandle, 'xdata', 0:gen, 'ydata', minDist);
    

end