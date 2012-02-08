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

best = choosebestdecisionattribute(attributes, examples, targets);
zeroIndices = find(~examples(:,best));
oneIndices  = find( examples(:,best));
neg_examples = examples(zeroIndices,:);
pos_examples = examples(oneIndices,:);
neg_targets  = targets(zeroIndices);
pos_targets  = targets(oneIndices);

if (isempty(pos_examples))
    pos_subtree.op = {};
    pos_subtree.kids = [];
    pos_subtree.class = majority_value(pos_targets);
else
    pos_subtree = decision_tree_learning(pos_examples,attributes,pos_targets);
end
if (isempty(neg_examples))
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
% Finds the majority value amongst a list of values
majority = mode(double(labels));
end