% loads in from file cleandata_students.txt



function [resultantTree] = main (outputToTrainFor)	

	% loads in the examples from cleandata_students.txt and creates the targets and attributes
	
	%Andy's code needs to go here
	[examples, targets]  = loaddata('cleandata_students.txt');
	
	outputs = filloutputs();
	
	checkinputattribute(outputs, outputToTrainFor);
	
	examples = matrix2cell(examples);
	
	resultantTree = true;
	% examples:
	%	a cell array of vectors: { [1 X 45] [1 X 45] ... } for each example
	
	% outputs:
	%	a cell array of strings e.g. { 'anger' 'happiness' ... }
	
	% targets
	%	a matrix of the correct output for each of the examples: [ 1 2 6 4 3 ... ]
	
	
	
	%resultantTree = decisiontreelearning(examples, attributes, targets);
	
return

function [decisiontree] = decisiontreelearning (examples, attributes, targets)
	% algorithm from Table 4 in CBC manual
	best = choosebestdecisionattribute(attributes, examples, targets);
return


function [outputs] = filloutputs()
	%fills the attribute table from emolab2str
	numberEmotions = 7;
	outputs = cell(1, numberEmotions);
	for i = 1 : numberEmotions
		outputs{i} = emolab2str(i);
	end
return

function [] = checkinputattribute(outputs, outputToTrainFor)
	% checks that the attribute to tr
	outputExists = false;
	for i = 1 : size(outputs)
		output = outputs(i);
		if isequal(output{1}, outputToTrainFor)
			outputExists = true;
		end
	end
	if ~outputExists
		error('The given attribute was not seen in the list of attribute names.');
		resultantTree = false;
		return
	end
return

function [cells] = matrix2cell(matrix)
	% returns a cell array containing each example from the matrix
	cells = {1, size(matrix)};
	for i = 1 : size(matrix)
		cells{i} = matrix(i, :);
	end
	
return