function [ y ] = testTrees( T,x )
%
%TESTTREES - takes a set of generated trees and a set of examples and
%            returns a vector of predictions
%
%IN:  T: 6 different trees (one for each emotion)
%     x: set of examples
%OUT: y: vector of predictions

anger_res = evaluate_examples(x,T{1});
disg_res = evaluate_examples(x,T{2});
fear_res = evaluate_examples(x,T{3});
happy_res = evaluate_examples(x,T{4});
sad_res = evaluate_examples(x,T{5});
surp_res = evaluate_examples(x,T{6});
y = combine_results(anger_res,disg_res,fear_res,happy_res,sad_res,surp_res);

end

