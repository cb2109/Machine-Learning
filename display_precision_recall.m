function [ ] = display_precision_recall( pr )
%
%DISPLAY_PRECISION_RECALL - displays a 6 x 6 precision recall tle
%
%IN:  pr: a 6 x 6 precision/recall tle
%OUT: -

% Tab character (for layout)
t = char(9);
title = [t,t,'TP',t,t,'TN',t,t,'FP',t,t,'FN',t,t,'P',t,t,'R',t,t,'F1'];
disp(title)
for i = 1:6
    line = emolab2str(i);
    line = line(1:3);
    for j = 1:4
       line = [line,t,t,num2str(pr(i,j))];
    end
    line = [line,t];
    for j = 5:7
       line = [line,t,num2str(pr(i,j),'%4.3f')];
    end
    disp(line)
end
end

