function [ y ] = f_alpha( alpha,recall,precision )
%
%F_ALPHA - calculates the F alpha values for a given alpha, recall and
%          precision
%
%IN:  alpha: the value of alpha to use
%     recall: the recall value
%     precision: the precision value
%OUT: y: the F alpha measure

y = (1 + alpha) * ((precision * recall)/((alpha * precision) + recall));
end

