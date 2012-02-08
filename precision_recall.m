function [ y ] = precision_recall( confusion,targets )
%
%PRECISION_RECALL - calculates the precision and recall of a set of data
%
%IN:  confusion: a 6 x 6 confusion matrix
%OUT: y: a table containing - True Positives | True Negatives | 
%       False Positives | False Negatives | Recall | Precision | F1 Measure

y = zeros(6,7);
number = size(targets,1);
for i = 1:6
    
   % True Positives:
   tp = confusion(i,i);
   
   % False Positives:
   fp = 0;
   for j = 1:6
      fp = fp + confusion(j,i); 
   end
   fp = fp - tp;
   
   % False Negatives:
   fn = 0;
   for j = 1:6
      fn = fn + confusion(i,j); 
   end
   fn = fn - tp;
   
   % True Negatives
   tn = number - fp - fn - tp;
   
   % Recall:
   recall = tp / (tp + fn);
  
   % Precision:
   precision = tp / (tp + fp);
   
   % F1:
   f1 = f_alpha(1,recall,precision);
   
   % Fill in the table
   y(i,1) = tp;
   y(i,2) = tn;
   y(i,3) = fp;
   y(i,4) = fn;
   y(i,5) = precision;
   y(i,6) = recall;
   y(i,7) = f1;
   
end
end

