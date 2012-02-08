%assumes each example an array of structs with form 
% example:
%	example.choices = array of the attribute values taken
%   example.result = a result 

function [best] = choosebestdecisionattribute(attributes, examples, targets)
	% attributes are the features/attributes. The names of the attributes
	% examples is a N x size(attributes) matrix of the examples, where N is the number of examples
	% target is an array showing the result of each example (whether it's a positive or negative)
	%			based on a 0 for negative, 1 for positive basis.
	%returns an attribute that is best to make the next split on.

	% sets bestValue as 0, which is the lowest possible gain
	bestValue = 0;
	best = attributes(1);
	%pick an atrribute, work out the gain
	for i = 1 : length(attributes)

		curAttribute = attributes(i);
        values = [examples(:, curAttribute), targets];
		val = gain(values);

		if val >= bestValue
			best = curAttribute;
			bestValue = val;
		end
    end
end	

function [gain] = gain (attributeSet)
	% performs the caluation for gain given in the notes
	% attributeSet: is an array s.t. attributeSet[i].value = Real, attributeSet[i].result = {0, 1}
	noPos = countRes(attributeSet(:, 2), 1);
	noNeg = countRes(attributeSet(:, 2), 0);

	% gain = id3(positive, negaive) - Remainder(attributeSet)
	gain = iDThree(noPos, noNeg) - remainder(attributeSet);

end
	
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
end

function [remainder] = remainder(attributeSet)
	% attribute subset: an array of attributes combined with results
	% attr v1       v2      v3
	%       result  result  result

	values = attributeSet(:, 1);
    results = attributeSet(:, 2);

    options = unique(values);

    count = size(values, 1);
    remainder = 0;

    for i = 1 : length(options)
        indices = find(values == options(i));
        positive = sum(results(indices));
        negative = sum(~results(indices));

        remainder = remainder ...
        + ((positive + negative) / count) * iDThree(positive, negative);
    end
end

function [no] = countRes(results, valToCompare)
	% given a result value to compare to
	% this functions counts everything in the array with value == valToComplare
    no = length(results(results == valToCompare));
end
