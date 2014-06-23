function geneticAlgorithm(xMax, yMax, numOfChrom, generations, popSize, mutProb)
    %Setup the plots
    [pathHandle, geneHandle, distHandle] = setupPlots(xMax, yMax, numOfChrom, popSize, generations);

    %Generate the locations
    [start, stop, locations] = generateLocations(numOfChrom, xMax, yMax);

    %Generate initial population
    population = generatePopulation(numOfChrom, popSize);

    distHistory = zeros(generations, 1);


    %Starting a loop
    for i = 1:generations



        %Inside this loop, the first step is fitness evaluation
        %This will be the shortest distance
        fitValues = calculateFitness(start, stop, locations, population, popSize, numOfChrom);
        fitSave = population(:, find(fitValues == min(fitValues)));
%         min(fitValues)
        distHistory(i) = min(fitValues);
        
        %Convert the minimum fitValue to the selected path
        
        path = convertPathToCart(start, stop, locations, population, fitValues, numOfChrom);
        
        %Display the output before updating the population for the next
        %generation
        updatePlots(pathHandle, geneHandle, distHandle, start, stop, locations, path, population, generations);
       

        %Selection
        %Normalise the fitness so that they are a percentage of the overall
        %population
        normFitVals = normaliseFitness(fitValues, popSize);
        
        %Create the intermediate population
        interPop = generateIntermediatePopulation(population, normFitVals, numOfChrom, popSize);
        %Stochastic Sampling

        %Recombination
%         disp('Generate Child Population');
        interPop = generateChildPopulation(interPop, numOfChrom, popSize);
        

        %Mutation
%         disp('Generate Mutation');
        interPop = generateMutations(interPop, numOfChrom, popSize, mutProb);
        
        population = interPop;

%         set(distHandle, 'xdata', 1:generations, 'ydata', distHistory);
%         figure(3); clf;hold on;
%         plot(1:generations, distHistory, 'g');
%         axis([0 generations 0 max(distHistory)]);
%         hold off;
        drawnow;
%         pause()

        population(:,end) = fitSave(:,1);
%         fitSave;
    end
    
    figure(3); clf;hold on;
	plot(1:generations, distHistory, 'g');
    axis([0 generations 0 max(distHistory)]);
    hold off;


end