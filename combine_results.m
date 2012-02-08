function [ y ] = combine_results( ang,dis,fea,hap,sad,sur )
%
%COMBINE_RESULTS - combines 6 lists of positive/negative results into one
%                  list of results with appropriate labels 
%
%IN:  ang/dis/fea/hap/sad/sur: 6 results vectors
%OUT: y: list of remapped results

y = zeros(size(ang));
ang = unmap_labels('anger',ang);
dis = unmap_labels('disgust',dis);
fea = unmap_labels('fear',fea);
hap = unmap_labels('happiness',hap);
sad = unmap_labels('sadness',sad);
sur = unmap_labels('surprise',sur);
for i = 1:size(y)
    y(i) = pick_label(ang(i),dis(i),fea(i),hap(i),sad(i),sur(i));
end
end

function [ label ] = pick_label( a,b,c,d,e,f )
% Picks a random label from those that are set, or
% guess a random expression if no tree recognizes it
%label = unidrnd(6);
label = 1;
set = find([a b c d e f]);
if size(set)
    pick = unidrnd(size(set,2));
    label = set(pick);
end
end
