function [ ] = display_confusion_matrix( confusion )
%
%DISPLAY_CONFUSION_MATRIX - displays a 6 x 6 confusion matrix
%
%IN:  confusion: a 6 x 6 confusion matrix
%OUT: -

tab = char(9);
title = tab;
for i = 1:6
   emo = emolab2str(i);
   title = [title,tab,tab,emo(1:3)];
end
disp(title)
for i = 1:6
    line = emolab2str(i);
    line = [line(1:3),tab];
    for j = 1:6
       line = [line,tab,tab,num2str(confusion(i,j))];
    end
    disp(line)
end
end
