function [ y,u ] = confusion_matrix( results,targets )
%
%CONFUSION_MATRIX - generates a confusion matrix based on the results of 
%                   an experiment and the actual target values
%
%IN:  results: array of results from an experiment
%     targets: actual target values
%OUT: y: 6 x 6 confusion matrix
%     u: number of unrecognised emotions

y = zeros(6);
i = 1;
u = 0;
while (i <= length(results))
    if (~(results(i) == 7))
        y(targets(i),results(i)) = y(targets(i),results(i)) + 1;
    else
        u = u + 1;
    end
    i = i + 1;
end
end

