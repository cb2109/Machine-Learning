%assumes each example an array of structs with form 
% example:
%	example.choices = array of the attribute values taken
%   example.result = a result 

function [result] = tester()
	attributes = { 'one' 'two' 'three'};
	examples = { [0 1 1] [1 0 1] [1 1 1] [0 1 0]};
	targets = {1 0 1 1};
	result = choosebestdecisionattribute(attributes, examples, targets);

return

function [best] = choosebestdecisionattribute(attributes, examples, targets)
	% attrubutes are the features/attributes. The names of the attributes
	% examples is a N x size(attributes) matrix of the examples, where N is the number of examples
	% target is an array showing the result of each example (whether it's a positive or negative)
	%			based on a 0 for negative, 1 for positive basis.
	%returns an attribute that is best to make the next split on.
	
	% sets bestValue as 0, which is the lowest possible gain
	bestValue = 0;
	
	%pick an atrribute, work out the gain
	for i = 1 : length(attributes)
	
		curAttribute = attributes(i)
		values = struct('value', {}, 'result', {});
		
		for j = 1 : length(examples)
			example = examples(j);
			example = example{1};
			curValue.value = example(1, i);
			curValue.result = targets(j);
			values(j) = curValue;
		end
		
		val = gain(values)
		
		if val >= bestValue
			best = curAttribute;
			bestValue = val;
		end
	end
		
return	

function [gain] = gain (attributeSet)
	% performs the caluation for gain given in the notes
	% attributeSet: is an array s.t. attributeSet[i].value = Real, attributeSet[i].result = {0, 1}
	noPos = countPositive(attributeSet);
	noNeg = countNegative(attributeSet);
	
	% gain = id3(positive, negaive) - Remainder(attributeSet)
	gain = iDThree(noPos, noNeg) - remainder(attributeSet);
	
return;
	
function [idtVal] = iDThree (noPositive, noNegative)
	% performs the ID3 calculation given in the spec
	p = noPositive/(noPositive + noNegative);
	n = noNegative/(noPositive + noNegative);
	% result = (-p log2 p) - (n log2 n)
	leftVal = 0;
	rightVal = 0;
	if p > 0
		leftVal = -1 * p * (log(p)/log(2));
	end
	if n > 0
		rightVal = -1 * n * (log(n)/log(2));
	end
	idtVal =  leftVal + rightVal;
return

function [remainder] = remainder(attributeSet)
	% attribute subset: an array of attributes combined with results
	% attr v1       v2      v3
	%       result  result  result
	%
	% where attr is an array of pairs: attr[0].value, attr[1].result
		
	values = attributeSet;
		
	overallPos = countPositive(attributeSet);
	overallNeg = countNegative(attributeSet);
		
	sum = 0.0;
		
	% while there are still values to be handled
	% this loop repeatedly goes through values collecting
	% all the attributes with the same value and performing
	% the calculation in the notes on them
	while ~isempty(values)
	
		% initialize the current value with the first element of values
		curValue = struct(values(1));
		% removes element 1 from the list
		values(1) = [];
		curValueSize = 2;
		
		% place for storing values that weren't visited
		remainingValues = struct('value', {}, 'result', {});
		remainingValuesSize = 1;
		
		% for each remaining value
		for j = 1 : length(values)
			% if the values of the attribute are the same,
			% add it to the array and remove it from values
			if isequal(curValue(1).value, values(j).value)
				curValue(curValueSize) = values(j);
				curValueSize = curValueSize + 1;
			else
				remainingValues(remainingValuesSize) = values(j);
				remainingValuesSize = remainingValuesSize + 1;
			end
		end
		
		% counts the number of positive and negative for this example
		noPos = countPositive(curValue);
		noNeg = countNegative(curValue);
		
		% does calc: ((pi+ni)/(p+n)) * idThree(pi, ni)
		val = iDThree(noPos, noNeg);
		val = val * ((noPos + noNeg)/(overallPos + overallNeg));
		
		% removes all the visited elements of values
		values = remainingValues;
		
		% performs sumation
		sum = sum + val;
	end
	
	remainder = sum;

return


function [noPos] = countPositive(arrayExamples)
	%counts all positive examples
	noPos = countRes(arrayExamples, 1);
return

function [noNeg] = countNegative(arrayExamples)
	%counts all negative examples
	noNeg = countRes(arrayExamples, 0);
return;

function [no] = countRes(arrayExamples, valToCompare)
	% given a result value to compare to
	% this functions counts everything in the array with value == valToComplare
	no = 0;
	for i = 1 : length(arrayExamples)
		example = arrayExamples(i);
		result = example.result(1);
		if result{1} == valToCompare
			
			no = no + 1;
			
		end
	end
return;