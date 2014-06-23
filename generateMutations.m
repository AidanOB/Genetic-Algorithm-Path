function mutatePop = generateMutations(pop, numOfChrom, popSize, mutProb)
    %This function provides a mutation chance for each child.
    %This enables new paths to be discovered in the genetic algorithm.
    
    %pop is the population to be mutated
    %numOfChrom is the number of chromosomes in the individual
    %popSize is the size of the population
    %mutProb is the probability that a mutation occurs
    mutatePop = pop;
    for i = 2:popSize
%         disp('Here')
        mutate = (rand < mutProb);
        if mutate
            mutatePop(:,i);
%             for j = 1:randi(uint16(numOfChrom/5))
                loc1 = randi(numOfChrom);
                loc2 = randi(numOfChrom);
                temp = mutatePop(loc1,i);
                mutatePop(loc1, i) = mutatePop(loc2, i);
                mutatePop(loc2, i) = temp;
%             end
            mutatePop(:,i);
%             pause()
        end
    end
    

end