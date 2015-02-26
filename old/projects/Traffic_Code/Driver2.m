clc
basefiles = '../Images/13/';
baseout = '../Results/13/';
background = imread('../Images/background/background.jpg');
lane_im = imread('../Images/background/lanes.png');
pics = get_pic_names(basefiles);
clusters = {};
disp(length(pics));
totalwait = 0;
for i = 3:length(pics)
  fin = sprintf('%s%s',basefiles,pics(i).name);
  disp(i);
  %disp(fin);
  frame = imread(fin);
  [newframe, thresh_im] = neutral(frame, background, 50);
  [clusterlist, clusterframe] = getClusters(frame,thresh_im,250,lane_im);
  clusters{i} = clusterlist;
  timediff = (time_from_name(pics(i).name) - time_from_name(pics(i-1).name)) * 24 * 60 * 60;
  totalwait = totalwait + timediff*waiters(clusters{i}, clusters{i-1}, .15);
  fin = sprintf('%s%s',basefiles,pics(i).name);
  fout = sprintf('%s%s',baseout,pics(i).name);
  add_arrows(fin,fout,clusters{i});
end
inout = calc_flows_inout(clusters);

flowmatrix = buildFlows(inout);

%stop_time = stoptime(cluster);
