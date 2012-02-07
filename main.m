% loads in from file cleandata_students.txt



function [resultantTree] = main (outputToTrainFor)	

	% loads in the examples from cleandata_students.txt and creates the targets and attributes
	
	[examples, targets]  = loaddata('cleandata_students.txt');
    % Do 10 fold cross evaluation...
    results = [];
    final_targets = [];
    num_per_fold = floor(size(examples,1) / 10);
    current_num = 1;
    for i = 1:10
        end_fold = current_num + num_per_fold;
        test_set = [];
        train_set = [];
        train_targets = [];
        test_targets = [];
        for j = 1:size(examples,1)
            if ((j >= current_num) && (j < end_fold))
                test_set = vertcat(test_set,examples(j,:));
                test_targets = vertcat(test_targets,targets(j));
            else
                train_set = vertcat(train_set,examples(j,:));
                train_targets = vertcat(train_targets,targets(j));
            end
        end
        % Create and evaluate trees for each emotion
        for j = 1:6
            emo_targets = remap_labels(emolab2str(j),train_targets);
            trees{j} = decision_tree_learning(train_set,1:45,emo_targets);
        end
        % Combine the results and add them to the list
        fold_res = testTrees(trees,test_set);
        results = vertcat(results,fold_res);
        final_targets = vertcat(final_targets,test_targets);
        current_num = end_fold;
    end
    resultantTree = results;
    evaluate_results(results,final_targets);
    %anger_targets = remap_labels('anger',targets);
	%resultantTree = decision_tree_learning(examples,1:45,anger_targets);
end