function [ y ] = remap_labels( emotion, labels )
%
%REMAP_LABELS - classifies a list of emotion lables into positive (1) or
%               negative (0) examples
%
%IN:  emotion: name of emotion to test for [string]
%     labels: emotion labels
%OUT: y: list of remapped labels

y = zeros(size(labels));
emo_val = str2emolab(emotion(1:4));
for i = 1:size(labels)
    if labels(i) == emo_val
        y(i) = 1;
    end
end
end

