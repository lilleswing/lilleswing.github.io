function [newframe] = show_cluster_frame(clusts, clusterframe)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [row col] = size(clusterframe);
    newframe = zeros(row,col);
    for i = 1:row
        for j = 1:col
            for k = 1:length(clusts)
                if(clusterframe(i,j) == clusts(k))
                    newframe(i,j) = 1;
                end
            end
        end
    end
    imshow(newframe);
end

