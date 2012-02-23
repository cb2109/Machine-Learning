function ANN_condor_aggregate
    files = strtrim(regexp(ls('condor/*.mat'), '\s+', 'split'));
    num = size(files, 2);
    
    for i = 1:num
        c = char(files(:,i));
        if c
            rows(i,:) = load(c);
            if length(rows(i).topology) < 2
                rows(i).topology(1, 2) = 0;
            end
        end
    end
    
    topology = reshape([rows.topology], [], 2);
    x=topology(:,1);
    y=topology(:,2);
    z=[rows.avgf1]';
    
    F = TriScatteredInterp(x,y,z);
    
    dx=0.5;
    dy=0.5;
    x_edge=[floor(min(x)):dx:ceil(max(x))];
    y_edge=[floor(min(y)):dy:ceil(max(y))];
    [X,Y]=meshgrid(x_edge,y_edge);
    
    Z = F(X,Y);
    
    mesh(X,Y,Z);
    hold on;
    plot3(x,y,z,'o');
    grid on;
end