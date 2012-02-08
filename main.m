function [ results ]  = main ()	

	% loads in the examples from cleandata_students.txt
	
	[examples, targets]  = loaddata('cleandata_students.txt');
    % Do 10 fold cross evaluation...
    results = zeros(size(targets));
    num_per_fold = floor(size(examples,1) / 10);
    train_set_size = size(examples,1) - num_per_fold;
    test_set = zeros(num_per_fold,size(examples,2));
    train_set = zeros(train_set_size,size(examples,2));
    train_targets = zeros(size(targets));
    test_targets = zeros(size(targets));
    current_num = 1;
    for i = 1:10
        end_fold = current_num + num_per_fold;
        test_num = 1;
        train_num = 1;
        for j = 1:size(examples,1)
            if ((j >= current_num) && (j < end_fold))
                test_set(test_num,:) = examples(j,:);
                test_targets(test_num) = targets(j);
                test_num = test_num + 1;
            else
                train_set(train_num,:) = examples(j,:);
                train_targets(train_num) = targets(j);
                train_num = train_num + 1;
            end
        end
        % Create and evaluate trees for each emotion
        trees  = cell(6,1);
        for j = 1:6
            emo_targets = remap_labels(emolab2str(j),train_targets);
            trees{j} = decision_tree_learning(train_set,1:45,emo_targets);
        end
        % Combine the results and add them to the list
        fold_res = testTrees(trees,test_set);
        results(current_num:(end_fold - 1)) = fold_res;
        current_num = end_fold;
    end
    evaluate_results(results,targets);
end