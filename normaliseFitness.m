function normFit = normaliseFitness(fitValues, popSize)
%This function normalises the fitness so that the fitness value is a
%percentage value of the overall population. The worst fitness is
%eliminated, while the best has a higher proportion of the next generation
%This is designed for the selection criteria chosen.


%fitValues is the raw distance value where lower is better.
%pop is the current population, will probably not be needed except for
%verification
%The function returns normFit, a vector of values that are the percentage
%that each 
    normFit = zeros(popSize, 1);
    f = mean(fitValues);
%     f2 = normalize(fitValues)
    for i = 1:popSize
        normFit(i) = fitValues(i) / f;
    end
    normFit = (normFit - (max(normFit)-0.001)) * -1;
    
    normFit = normFit / sum(normFit);
%     pause();
    
end