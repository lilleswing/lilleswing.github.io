function [ clusters ] = addLanes( clusters, lanes )
%UNTITLED adds a column to clusters = which lane the cluster is in
%   input:
%   clusters - the list of clusters (Nx6)
%   lanes - the colored lane image (640x480)
%   output:
%   clusters - the list of clusters, with added lane value (Nx7)
%
%   lanes are number 1-4, from top to bottom

lo = 50;
hi = 100;

[h,w] = size(clusters);
for clust=1:h
   
    x = round(clusters(clust, 4));
    y = round(clusters(clust, 5));
    if(x==0 || y ==0)
        continue;
    end
    if lanes(y,x,1) > hi && lanes(y,x,2) < lo && lanes(y,x,3) < lo
        clusters(clust, 7) = 1;
    elseif lanes(y,x,1) < lo && lanes(y,x,2) > hi && lanes(y,x,3) < lo
        clusters(clust, 7) = 2;
    elseif lanes(y,x,1) < lo && lanes(y,x,2) < lo && lanes(y,x,3) < lo
        clusters(clust, 7) = 3;
    elseif lanes(y,x,1) < lo && lanes(y,x,2) < lo && lanes(y,x,3) > hi
        clusters(clust, 7) = 4;
    else
        clusters(clust, 7) = 0;
    end
end

end

