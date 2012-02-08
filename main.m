function [ results ]  = main ()	

	% loads in the examples from cleandata_students.txt
	[examples, targets]  = loaddata('cleandata_students.txt');
    results = zeros(size(targets));
    
    % Do 10 fold cross evaluation...
    num_per_fold = floor(size(examples,1) / 10);
    train_set_size = size(examples,1) - num_per_fold;
    test_set = zeros(num_per_fold,size(examples,2));
    train_set = zeros(train_set_size,size(examples,2));
    train_targets = zeros(train_set_size,size(examples,2));
    test_targets = zeros(num_per_fold,1);
    current_num = 1;
    for i = 1:10
        end_fold = current_num + num_per_fold;
        test_num = 1;
        train_num = 1;
        for j = 1:size(examples,1)
            if ((j >= current_num) && (j < end_fold))
                % Add this example to the test set
                test_set(test_num,:) = examples(j,:);
                test_targets(test_num) = targets(j);
                test_num = test_num + 1;
            else
                % Add the example to the training set
                train_set(train_num,:) = examples(j,:);
                train_targets(train_num) = targets(j);
                train_num = train_num + 1;
            end
        end
        % Create and evaluate trees for each emotion
        trees  = cell(6,1);
        for j = 1:6
            % Remap the target matrix into a list of 0s and 1s 
            emo_targets = remap_labels(emolab2str(j),train_targets);
            % Use the algorithm from the spec to create a tree
            trees{j} = decision_tree_learning(train_set,1:45,emo_targets);
        end
        % Combine the results and add them to the list
        fold_res = testTrees(trees,test_set);
        results(current_num:(end_fold - 1)) = fold_res;
        current_num = end_fold;
    end
    % Check the results and print them to screen
    evaluate_results(results,targets);
end