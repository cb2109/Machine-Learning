function [ avgf1, avgf6 ] = ANN_main( topology, learning_rate, trans_func, train_func )
%ANN_MAIN - Creates and tests a set of ANNs, then analyses and returns 
%           their results

    % Loads and transforms the examples from cleandata_students.txt
	[ex, tg]  = loaddata('cleandata_students.txt');
    [examples, targets] = ANNdata(ex,tg);
    single_results = zeros(size(tg));
    results = zeros(size(tg));
    
    % **********************
    % * Network Parameters *
    % **********************
    % Number of hidden layers/Neurons per hidden layer
    %topology = [10,2];
    % Learning rate (not used with all training functions)
    %learning_rate = 0.01;
    % Transfer functions: hardlim (perceptron), purelin (linear unit)
    % and tansig (sigmoid)
    %trans_func = 'tansig';
    % Training function: (eg. trainlm, trainscg etc.)
    %train_func = 'trainlm';
    % Epochs
    epochs = 100;
    
    % Do 10 fold cross evaluation...
    folds = 10;
    indices = crossvalind('Kfold',size(tg,1),folds);

    % trainlm > traingdr > trainscg
    single_net = feedforwardnet([10,5],'trainlm');
    %single_net.divideFcn = 'dividetrain';
    single_net.divideFcn = 'dividerand';
    single_net.divideParam.trainRatio = 0.8;
    single_net.divideParam.testRatio = 0.0;
    single_net.divideParam.valRatio = 0.2;
    single_net.trainParam.epochs = 100;
    single_net.trainParam.lr = 0.1;
    % purelin works best here!
    single_net.layers{1}.transferFcn = 'purelin';
    single_net.layers{2}.transferFcn = 'purelin';
    single_net.trainParam.goal = 0;
    single_net.trainParam.showWindow = 0;
    single_net.trainParam.showGUI = 0;
    
    net = feedforwardnet(topology,train_func);
    net.divideFcn = 'dividetrain';
    net.trainParam.epochs = 100;
    net.layers{1}.transferFcn = 'tansig';
    net.layers{2}.transferFcn = 'tansig';
    net.trainParam.goal = 0;
    net.trainParam.showWindow = 0;

    num_per_fold = floor(size(ex,1) / folds);
    train_set_size = size(ex,1) - num_per_fold;
    test_set = zeros(size(examples,1),num_per_fold);
    train_set = zeros(size(examples,1),train_set_size);
    train_targets = zeros(size(targets,1),train_set_size);
    test_targets = zeros(num_per_fold,1);
    output_targets = zeros(size(tg));
    current_num = 1;

    for i = 1:folds
        end_fold = current_num + num_per_fold;
        test_num = 1;
        train_num = 1;
        for j = 1:size(examples,2)
            if (indices(j) == i)
                % Add this example to the test set
                test_set(:,test_num) = examples(:,j);
                test_targets(test_num) = tg(j);
                test_num = test_num + 1;
            else
                % Add the example to the training set
                train_set(:,train_num) = examples(:,j);
                train_targets(:,train_num) = targets(:,j);
                train_num = train_num + 1;
            end
        end
        
        % Generate the single six output ANN
        
        single_net = configure(single_net,train_set,train_targets);
        single_net = train(single_net,train_set,train_targets);
        single_res = sim(single_net,test_set);

        % Uncomment to show results for each fold
        %evaluate_results(six_output_combine(single_res),test_targets);
        
        % Generate the six single output ANNs
        

%         % Anger
%         emo_targets = train_targets(1,:);
%         net = configure(net,train_set,emo_targets);
%         net = train(net,train_set,emo_targets);
%         anger_res = sim(net,test_set);
%         
%         % Disgust
%         emo_targets = train_targets(2,:);
%         net = configure(net,train_set,emo_targets);
%         net = train(net,train_set,emo_targets);
%         disg_res = sim(net,test_set);
%         
%         % Fear
%         emo_targets = train_targets(3,:);
%         net = configure(net,train_set,emo_targets);
%         net = train(net,train_set,emo_targets);
%         fear_res = sim(net,test_set);
%         
%         % Happiness
%         emo_targets = train_targets(4,:);
%         net = configure(net,train_set,emo_targets);
%         net = train(net,train_set,emo_targets);
%         happy_res = sim(net,test_set);
%         
%         % Sadness
%         emo_targets = train_targets(5,:);
%         net = configure(net,train_set,emo_targets);
%         net = train(net,train_set,emo_targets);
%         sad_res = sim(net,test_set);
%         
%         % Surprise
%         emo_targets = train_targets(6,:);
%         net = configure(net,train_set,emo_targets);
%         net = train(net,train_set,emo_targets);
%         surp_res = sim(net,test_set);
%         
%         % Combine the results and add them to the list
%         fold_res = combine_probability(anger_res',disg_res',fear_res', ...
%             happy_res',sad_res',surp_res');
        output_targets(current_num:(end_fold - 1)) = test_targets;
        single_results(current_num:(end_fold - 1)) = ...
            six_output_combine(single_res);
%       results(current_num:(end_fold - 1)) = fold_res;
        current_num = end_fold;
        
    end
    
    disp('Six Output Tree Results:')
    [x,y,avgf6] = evaluate_results(single_results,output_targets);
    disp(' ')
%     disp('Single Output Tree Results:')
%     [x,y,avgf1] = evaluate_results(results,output_targets);

end
