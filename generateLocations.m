function [ start, stop, locations ] = generateLocations( numOfLocations, xMax, yMax )
%GENERATELOCATIONS Creates the locations to start, stop and visiting
%locations in a random manner
%   numOfLocations is a scalar number that defines the number of locations
%   to be visited in addition to the end points
%   xMax is the size of the xRange [-xMax:xMax]
%   yMax is the size of the yRange [-yMax:yMax]
%   start returns a struct that holds the x and y co-ordinates
%   stop returns a struct that holds the x and y co-ordinates
%   locations returns a struct that has two vectors of matching
%   co-ordinates for the x and y co-ordinates

    start.x = randi([-xMax, xMax]);
    start.y = randi([-yMax, yMax]);
    
    stop.x = randi([-xMax, xMax]);
    stop.y = randi([-yMax, yMax]);
    
    locations.x = zeros(numOfLocations,1);
    locations.y = zeros(numOfLocations,1);
    
    for i = 1:numOfLocations,
        locations.x(i) = randi([-xMax, xMax]);
        locations.y(i) = randi([-yMax, yMax]);
    end
end

