function pop = generatePopulation(chrom, Size)
%generate Population creates a randomised sample to begin the genetic
%algorithm. Each column in the returned matrix (pop) is an individual in the
%population

%The values for each column are the index numbers of the locations
%generated seperately
    pop = zeros(chrom, Size);
    for i = 1:Size
        pop(:,i) = randperm(chrom);
    end
end