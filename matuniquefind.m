function [ x ] = matuniquefind( c )
    cs = unique(c, 'rows');
    invc = cellstr(c);
    x = zeros(size(cs, 2));
    for i = 1 : size(cs, 1)
        cs(i, :)
        strcmp(strtrim(cs(i, :)), invc)
        disp('_______________')
        
        
    end
end

