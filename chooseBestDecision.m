%assumes each example an array of structs with form 
% example:
%	example.choices = array of the attribute values taken
%   example.result = a result 

function [best] = chooseBestDecisionAtrribute(attributes, examples)
	%returns an attribute that is best to make the next split on.
	
return	
	
function [idtVal] = iDThree (noPositive, noNegative)
	% performs the ID3 calculation given in the spec
	p = noPositive/(noPositive * noNegative);
	n = noNegative/(noPositive * noNegative);
	% result = (-p log2 p) - (n log2 n)
	idtVal = -1 * p * (log(p)/log(2)) - n * (log(p)/log(2));
return

function [remainder] = remainder(attributeSubSets)
	% attribute subset: an array of examples divided by their result for a specific attribute
	%					the array contains both positive and negative examples.
	
	for i = 1 : size(attributeSubSets)
		noPos = countPositive(attributeSubSets[i]);
		noNeg = countNegative(attributeSubSets[i]);
		
	end
	
return

function [noPos] = countPositive(arrayExamples)
	noPos = countVal(arrayExamples, 1);
return

function [noNeg] = countNegative(arrayExamples)
	noNeg = countVal(arrayExamples, 0);
return;

function [no] = countVal(arrayExamples, valToCompare)
	no = 0;
	for i = 1 : size(arrayExamples)
		if (arrayExamples.result == valToCompare)
			
			no++;
			
		end
	end
return;