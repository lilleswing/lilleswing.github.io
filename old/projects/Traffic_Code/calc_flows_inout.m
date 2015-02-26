function [inout] = calc_flows_inout( clusterlist)
%calc_flows_inout Calculates an inout list of flows of cars
%   Clusterlist - a list of clusterlists, a list of matrixes,
%   one for each frame.
    frames = length(clusterlist);
    inout = {};
    cars = 1;
    for frame = 1:frames
        clusters = clusterlist{frame};
        [numclusters col]  = size(clusters);
        for cluster = 1:numclusters
            offset = 1;
            t_in = clusters(cluster, :);
            t_out = clusters(cluster, :);
            %disp(t_out);
            while(frame+offset <= frames)
                index = findClusterMatch(t_out, clusterlist{frame+offset}, 0.9); 
                if(index == 0)
                    break
                end
                t_out = clusterlist{frame+offset}(index, :);
                %now remove the analog
                t_clusters = clusterlist{frame+offset};
                t_clusters(index,:) = [];
                clusterlist{frame+offset} = t_clusters;
            end
            inout{cars} = [t_in; t_out];
            cars = cars + 1;
        end
        
    end

end

