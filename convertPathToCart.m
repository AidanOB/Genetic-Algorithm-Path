function path = convertPathToCart(start, stop, locations, pop, fitValues, points)
    %convertPathToCart converts the chromosomes of the fitest individual to
    %the cartesian co-ordinates of the locations for display in the graph
    
    %The added 2 allows for the start and end locations to be added in
    path.x = zeros(points+2, 1);
    path.y = zeros(points+2, 1);
    
    
    fittest = find(fitValues == min(fitValues));
    %pop(:,fittest)
    %Input the start and finish locations of the path, since they will be
    %constant
    
    path.x(1) = start.x;
    path.y(1) = start.y;
    path.x(end) = stop.x;
    path.y(end) = stop.y;
    
    for i = 2:points+1
        path.x(i) = locations.x(pop(i-1, fittest(1)));
        path.y(i) = locations.y(pop(i-1, fittest(1)));
    end

end