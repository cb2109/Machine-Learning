function [ y ] = confusion_matrix( results,targets )
%
%CONFUSION_MATRIX - generates a confusion matrix based on the results of 
%                   an experiment and the actual target values
%
%IN:  results: array of results from an experiment
%     targets: actual target values
%OUT: y: 6 x 6 confusion matrix

y = zeros(6);
i = 1;
while (i <= size(results,2))
    y(targets(i),results(i)) = y(targets(i),results(i)) + 1;
    i = i + 1;
end
end

