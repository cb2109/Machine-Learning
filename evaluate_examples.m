function [ results ] = evaluate_examples ( examples,tree )
%
%EVALUATE_EXAMPLES - evaluates a set of examples against a given decision
%                    tree and returns a set of results
%
%IN:  examples: N x 45 array of examples to test against
%     tree: a decision tree to use
%OUT: results: N x 1 array of 0 or 1 values

results = zeros(size(examples,1),1);
for i = 1:size(examples)
   example = examples(i,:);
   current_node = tree;
   classified = 0;
   while (~classified)
      if (size(current_node.kids) == 0)
          % Leaf node
          classified = 1;
          results(i) = current_node.class;
      else
          if (example(current_node.op) == 1)
             current_node = current_node.kids{1};
          else
             current_node = current_node.kids{2}; 
          end
      end
   end
end
end

