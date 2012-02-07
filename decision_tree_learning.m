function [ tree ] = decision_tree_learning ( examples,attributes,targets )
%
%DECISION_TREE_LEARNING - creates a decision tree based on a set of
%                         examples and targets. Algorithm used is given in
%                         table 4 of the CBC.
%
%IN:  examples: N x 45 array of examples to learn from
%     attributes: list of possible attributes to test of (all values 1-45)
%     targets: N x 1 list of target values for each example
%OUT: tree: a decision tree
if (same_label(targets))
    tree.op = {};
    tree.kids = {};
    tree.class = targets(1);
    return
elseif (size(attributes) == 0)
    tree.op = {};
    tree.kids = {};
    tree.class = majority_value(targets);
    return 
end
best = choosebestdecisionattribute(attributes, matrix2cell(examples), targets);
%best = attributes(unidrnd(length(attributes)));
attributes = remove(best,attributes);
pos_examples = [];
pos_targets = [];
neg_examples = [];
neg_targets = [];
for i = 1:size(examples)
    ex = examples(i,:);
    if (examples(i,best))
        pos_examples = vertcat(pos_examples,ex);
        pos_targets = vertcat(pos_targets,targets(i));
    else
        neg_examples = vertcat(neg_examples,ex);
        neg_targets = vertcat(neg_targets,targets(i));
    end
end
if (size(pos_examples) == 0)
    pos_subtree.op = {};
    pos_subtree.kids = [];
    pos_subtree.class = majority_value(pos_targets);
else
    pos_subtree = decision_tree_learning(pos_examples,attributes,pos_targets);
end
if (size(neg_examples) == 0)
    neg_subtree.op = {};
    neg_subtree.kids = [];
    neg_subtree.class = majority_value(neg_targets);
else
    neg_subtree = decision_tree_learning(neg_examples,attributes,neg_targets);
end
tree.op = best;
tree.kids = {pos_subtree neg_subtree};
tree.class = {};
end


function [ bool ] = same_label ( labels )
% Checks if a list of labels are all the same
for j = 1:(size(labels) - 1)
    if (~(labels(j) == labels(j+1)))
        bool = 0;
        return
    end
end
bool = 1;
end


function [ majority ] = majority_value ( labels )
% Checks for the most common value among a list of 0s and 1s
ones = 0;
zeros = 0;
for k = 1:size(labels,2)
    if (labels(k) == 0)
        zeros = zeros + 1;
    else
        ones = ones + 1;
    end
end
majority = 0;
if (ones > zeros)
    majority = 1;
end
end

function [ removed ] = remove ( value,list )
% Removes a value from a list
removed = [];
for i = 1:size(list,2)
    if ~(list(i) == value)
        removed = horzcat(removed,list(i)); 
    end
end
end

function [cells] = matrix2cell(matrix)
	% returns a cell array containing each example from the matrix
	cells = {1, size(matrix)};
	for i = 1 : size(matrix)
		cells{i} = matrix(i, :);
	end
	
end