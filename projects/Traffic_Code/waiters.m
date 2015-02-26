function [ waits ] = waiters ( clusters, lastclusters, thresh )
%UNTITLED2 outputs 8th column for traffic waiting
%   input:
%   clusters - the list of clusters (Nx7)
%   thresh - a percent tollerance threshold for change in values
%   output:
%   clusters - list of clusters with waiting collumn (Nx8)
%               value is 1 if cluster waited since last frame, 0 if not

[h,w] = size(clusters);
[hl,wl] = size(lastclusters);
waits = 0;

for clust=1:h
    for lclust=1:hl
        notmove = 1;
        for attr=1:6
            if abs(clusters(clust,attr) - lastclusters(lclust,attr))/lastclusters(lclust,attr) > thresh
                notmove = 0;
            end
        end
        if notmove == 1
            waits = waits + 1;
            break;
        end
    end
end

end

