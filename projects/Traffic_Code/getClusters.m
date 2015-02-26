function [ clusterlist, clusterframe ] = getClusters( frame, thresh_im, size_thresh,lanes )
%UNTITLED2 finds the clusters in a frame, and determines their values
%   input:
%   frame - the original frame
%   thresh_im - clusters to be catagorized
%   size_thresh - threshold for cluster size
%   output:
%   clusterlist - list of n-tuple clusters (r, g, b, x, y, size)
%   clusterframe - visualization of the clusters

[h, w, d] = size(frame);
clusterframe = zeros(h,w); %for numbering clusters
nclusters = 2;
clustersizes = zeros(100,1);
thresh_im = ~thresh_im;
thresh_im = logical(thresh_im);
for x=2:639
    for y=2:479
        if(thresh_im(y, x) == 0)
            nclusters = nclusters + 1;
            k = imfill(thresh_im,[y x], 8);
            j = thresh_im-k;
            clusterframe = clusterframe + (-nclusters * j);
            thresh_im = logical(k);

            clustersizes(nclusters) = nnz(j); 
        end
    end
end
%disp('nonzero elements');
%disp(nnz(clusterframe));
%number the clusters
clusters = zeros(1,6);
%filter clusters by size
count = 0;
for x=2:639
    for y=2:479
        if(clusterframe(y,x) == 0)
            continue
        end
        %size:
        count = count+1;
        clusters(clusterframe(y,x), 6) = clustersizes(clusterframe(y,x));
        %add up; divide by size later
        %display(frame(y,x,1));
        clusters(clusterframe(y,x), 1) = clusters(clusterframe(y,x), 1) + double(frame(y,x,1));  %r
        clusters(clusterframe(y,x), 2) = clusters(clusterframe(y,x), 2) + double(frame(y,x,2));  %g
        clusters(clusterframe(y,x), 3) = clusters(clusterframe(y,x), 3) + double(frame(y,x,3));  %b
        clusters(clusterframe(y,x), 4) = clusters(clusterframe(y,x), 4) + x;  %x
        clusters(clusterframe(y,x), 5) = clusters(clusterframe(y,x), 5) + y;  %y
    end
end
%disp(nnz(clusterframe));
%divide attributes by cluster size
[h, w] = size(clusters);
for clust=1:h
    for attr=1:5
        if clusters(clust,6) > 0
            clusters(clust,attr) = clusters(clust,attr)/clusters(clust,6);
        end
    end
end
clusters = addLanes(clusters,lanes);
%joinclusters(clusters,size_thresh);
clusterlist = [];
[row col] = size(clusters);
clusnums = [];
for i = 1:row
    if(clusters(i,6) >= size_thresh)
        if((clusters(i,7) == 1 || clusters(i,7) == 2) || clusters(i,7) == 0)
            clusterlist = [clusterlist ; clusters(i, :)];
            clusnums = [clusnums i];
        end
    
    end
    if(clusters(i,6) >= size_thresh*4 && clusters(i,7) == 3)
        clusterlist = [clusterlist ; clusters(i, :)];
        clusnums = [clusnums i];
    end
    if(clusters(i,6) >= size_thresh*5 && clusters(i,7) == 4)
        clusterlist = [clusterlist ; clusters(i, :)];
        clusnums = [clusnums i];
    end
end
%show_cluster_frame(clusnums, clusterframe);


end

