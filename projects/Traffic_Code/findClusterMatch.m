function [ match ] = findClusterMatch( cluster, clusterlist, thresh )
%UNTITLED5 returns the index of the matching cluster
%   input:
%   cluster - the cluster to find a match for
%   clusterlist - list of clusters to search (Nx7)
%   thresh - variability threshold (percent)
%   output:
%   match - the index of the match


[hl,wl] = size(clusterlist);


match = 0;
goodmatch = 1;
for lclust=1:hl
    goodmatch = 1;
    for attr=1:3
        if abs(cluster(attr) - clusterlist(lclust,attr))/clusterlist(lclust,attr) > thresh
            goodmatch = 0;
        end
    end
    if abs(cluster(6) - clusterlist(lclust,6))/clusterlist(lclust,6) > thresh
        goodmatch = 0;
    end
    if goodmatch == 1
        match = lclust;
        break;
    end
end



end

