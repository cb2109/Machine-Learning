function [ y ] = precision_recall( confusion )
%
%PRECISION_RECALL - calculates the precision and recall of a set of data
%
%IN:  confusion: a 6 x 6 confusion matrix
%OUT: y: a table containing - True Positives | False Positives |
%        False Negatives | Recall | Precision | F1 Measure

y = zeros(6);
for i = 1:6
   % True Positives:
   tp = confusion(i,i);
   y(i,1) = tp;
   % False Positives:
   fp = 0;
   for j = 1:6
      fp = fp + confusion(j,i); 
   end
   fp = fp - tp;
   y(i,2) = fp;
   % False Negatives:
   fn = 0;
   for j = 1:6
      fn = fn + confusion(i,j); 
   end
   fn = fn - tp;
   y(i,3) = fn;
   % Recall:
   recall = tp / (tp + fn);
   y(i,4) = recall;
   % Precision:
   precision = tp / (tp + fp);
   y(i,5) = precision;
   % F1:
   y(i,6) = f_alpha(1,recall,precision);
end
end

