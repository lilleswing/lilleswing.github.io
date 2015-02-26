function [nclusters ] = karl_cluster( frame,thresh_im,size_thresh )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    nclusters = 2;
    [h, w] = size(thresh_im);
    %disp(h);
    %disp(w);
    clus_frame = frame;
    for i = 1:w
        for j = 1:h
            if(thresh_im(i,j) == 1)
                imfill(clus_frame,[i j], nclusters);
                nclusters = nclusters +1;
            end
            
        end
    end
    

end

