function ANN_condor( topology, learning_rate, trans_func, train_func, process)
%ANN_CONDOR Summary of this function goes here

    avgf1 = ANN_main(topology, learning_rate, trans_func, train_func);
    
    save(['condor/result-', num2str(process)]);
    %exit;
end

