function fitValues = calculateFitness(start, stop, locations, pop, popSize, chromes)
%calculateFitness calculates the distances that each path travels. 
%It starts at the start position, travels to each location in the order
%given in each chromosome in the population then to the end location
%Pop is a matrix where columns are individuals. It assumes that each member
%of the population travels to each location only a single time

    fitValues = zeros(popSize, 1);
%     pop
    for i = 1:popSize
        %This line calculates the fitness from the start location to the
        %start of the chromosone
        fitValues(i) = pdist2([start.x, start.y], [locations.x(pop(1,i)), locations.y(pop(1,i))]);

        %This loop calculates the distances between each location in the
        %path given in the chromosome
        for j = 2:chromes
            fitValues(i) = fitValues(i) + pdist2([locations.x(pop(j-1,i)), locations.y(pop(j-1,i))],...
                [locations.x(pop(j,i)), locations.y(pop(j,i))]);

        end
        
        %This line simply calculates the distance from the end of the
        %chromosome to the finish point
        fitValues(i) = fitValues(i) + pdist2([stop.x, stop.y], [locations.x(pop(end,i)), locations.y(pop(end,i))]);
        
    end
end