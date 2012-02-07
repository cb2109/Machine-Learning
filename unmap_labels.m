function [ y ] = unmap_labels( emotion, labels )
%
%UNMAP_LABELS - converts a list of 0,1 values into a list of emotions
%
%IN:  emotion: name of emotion to change to [string]
%     labels: emotion labels (either 0 or 1)
%OUT: y: list of remapped labels

y = zeros(size(labels));
emo_val = str2emolab(emotion(1:4));
for i = 1:size(y)
    if labels(i) == 1
        y(i) = emo_val;
    end
end
end
