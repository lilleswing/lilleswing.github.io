function [ flowMatrix ] = buildFlows( clust_inout )
%UNTITLED4 builds the 4x4 flow matrix 
%   input:
%   clust_inout - list of clusters, each with in and out(Nx2x7)
%   output:
%   flowMatrix - the matrix of flows (DUH)

flowMatrix = zeros(4,4);
l = numel(clust_inout);

for x=1:l
    cluster = clust_inout{x};
    if(cluster(1,7) == 0 || cluster(2,7) == 0)
        continue;
    end
    if cluster(1,6) == cluster(2,6)
            if cluster(1,7) == 1
                flowMatrix(1,3) = flowMatrix(1,3) + 1;
            elseif cluster(1,7) == 2
                flowMatrix(3,2) = flowMatrix(3,2) + 1;
            elseif cluster(1,7) == 3
                flowMatrix(3,3) = flowMatrix(3,3) + 1;
            elseif cluster(1,7) == 4
                flowMatrix(4,4) = flowMatrix(4,4) + 1;
            end
    elseif cluster(1,7) == cluster(2,7)
        if cluster(1,7) == 1;
            flowMatrix(1,3) = flowMatrix(1,3) + 1;
        elseif cluster(1,7) == 2;
            flowMatrix(3,2) = flowMatrix(3,2) + 1;
        end
    else
        flowMatrix(cluster(1,7),cluster(2,7)) = flowMatrix(cluster(1,7),cluster(2,7)) + 1;
    end
end


end

