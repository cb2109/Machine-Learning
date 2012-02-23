function [mz,mq] = ANN_condor_aggregate
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
    
    c=char(rows.trans_func);
    cx=idx(c);
    z=[rows.avgf1]';
    q=[rows.avgf6]';
    
    scatter(cx,z);
    hold on;
    scatter(cx,q);
    
    %{
    mz = average(x,y,z);
    mq = average(x,y,q);
    
    
    F = TriScatteredInterp(x,y,z);
    G = TriScatteredInterp(x,y,q);
    
    dx=0.1;
    dy=0.1;
    x_edge=[floor(min(x)):dx:ceil(max(x))];
    y_edge=[floor(min(y)):dy:ceil(max(y))];
    [X,Y]=meshgrid(x_edge,y_edge);
    
    Z = F(X,Y);
    Q = G(X,Y);
    
    figure;
    %mesh(X,Y,Z);
    mesh(x,y,z);
    hold on;
    %plot3(x,y,z,'o');
    grid on;
    xlabel('x - first layer');
    ylabel('y - second layer');
    
    figure;
    %mesh(X,Y,Q);
    mesh(x,y,q);
    hold on;
    %plot3(x,y,q,'x');
    grid on;
    xlabel('x - first layer');
    ylabel('y - second layer');
    %}
end

function x = idx(c)
    cs = unique(c,'rows');
    x = zeros(size(c,1), 1);
    for i = 1 : size(c,1)
        for j = 1 : size(cs,1)
            if all(cs(j,:) == c(i,:))
                x(i) = j;
                break
            end
        end
    end
end

function m = average(x, y, z)
    m = zeros(max(x), max(y));
    count = zeros(max(x), max(y));
    for i = 1 : length(x)
        count(x(i), y(i)) = count(x(i), y(i)) + 1;
        m(x(i), y(i)) = m(x(i), y(i)) + z(i);
    end
    m = m ./ count;
end