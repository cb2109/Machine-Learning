function ANN_condor( topology, learning_rate, trans_func, train_func, process)
%ANN_CONDOR Summary of this function goes here

    filename = ['condor/result-', '[', num2str(topology, '%d,'), ']-', ...
        num2str(learning_rate), '-', trans_func, '-', train_func, '-', ...
        num2str(process), '.mat'];
    avgf1 = ANN_main(topology, learning_rate, trans_func, train_func);
    save(filename, 'avgf1');
    exit;
    
end

