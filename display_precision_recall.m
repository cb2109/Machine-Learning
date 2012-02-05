function [ ] = display_precision_recall( pr )
%
%DISPLAY_PRECISION_RECALL - displays a 6 x 6 precision recall table
%
%IN:  pr: a 6 x 6 precision/recall table
%OUT: -

tab = char(9);
title = [tab,tab,'TP',tab,tab,'FP',tab,tab,'FN',tab,tab,'P',tab,tab,'R',tab,tab,'F1'];
disp(title)
for i = 1:6
    line = emolab2str(i);
    line = line(1:3);
    for j = 1:3
       line = [line,tab,tab,num2str(pr(i,j))];
    end
    line = [line,tab];
    for j = 4:6
       line = [line,tab,num2str(pr(i,j),'%4.3f')];
    end
    disp(line)
end
end

