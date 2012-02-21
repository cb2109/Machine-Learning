function [ n ] = count( value,list )
%COUNT - Count the number of instances of value in a given list 

    n = 0;
    for i = 1 : size(list)
        if list(i) == value
            n = n + 1;
        end
    end

end

