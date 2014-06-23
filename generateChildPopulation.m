function newPop = generateChildPopulation(pop, chrome, popSize)
%This function utilises the intermediate population to create the child
%population 
    fittest = pop(:,1);
    newPop = pop;
    if (mod(popSize, 2))
        maxPairs = popSize - 3;
    else
        maxPairs = popSize - 2;
    end
        
    for i = 2:2:maxPairs,
        %This step performs crossover
        tempA = pop(:,i);
        tempB = pop(:,i+1);
        dividePoint = randi([2 chrome-1]);
        %Temp A is gets the first section from B, then B gets the second
        %section from A
        tempA = [tempB(1:dividePoint,1);tempA(dividePoint+1:end,1)];
        tempB = [pop(1:dividePoint,i);tempB(dividePoint+1:end,1)];
        newPop(:,i) = tempA(:,1);
        newPop(:,i+1) = tempB(:,1);
    end

    for i = 1:popSize
        %This ensures that after crossover any double values in a child are
        %changed so it will possess all chromosomes
        %This works by making a counting vector for the length of an
        %individuals chromosomes. There will never be a number higher than
        %2 or lower than zero. 
        %Generate counting vector
        countVec = zeros(chrome, 1);
        
        %loop through the member and find the doubled numbers and missing
        %numbers
        for j = 1:chrome
            countVec(j) = sum(newPop(:,i) == j);
        end
        twoFind = find(countVec == 2);
        while ~isempty(twoFind)
            twoFind = find(countVec == 2);
            zeroFind = find(countVec == 0);
            if ~isempty(twoFind)
                missFind = find(newPop(:,i) == twoFind(1), 1, 'first');
                countVec(twoFind(1)) = 1;
                countVec(zeroFind(1)) = 1;
                newPop(missFind, i) = zeroFind(1);
            end
        end
    end
%     newPop(:,1) = fittest(:);

end