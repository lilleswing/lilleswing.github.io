%note: rgb gives WAY better results.

background = imread('../Images/background/background_12.jpg');
frame = imread('../Images/12/120447.6.jpg');
lane_im = imread('../Images/background/lanes.jpg');

%display(background)
[newframe, thresh_im] = neutral(frame, background, 350);
%showImage(newframe);
fig = showImageGray(thresh_im);
%imsave(fig);
[clusterlist, clusterframe] = getClusters(frame,thresh_im,250,lane_im);

%fig = showImageGray(clusterframe);
%imsave(fig);
%[clusterlist, clusterframe] = 
%karl_cluster(frame,thresh_im,100);
%clusterlist = addLanes(clusterlist, lane_im);