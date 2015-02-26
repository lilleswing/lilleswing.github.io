function [ fig ] = showImageGray( X )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(X);
fig = figure('Units','pixels','Position',[100 100 n m]);
imagesc(X); colormap(gray)
set(gca,'Position',[0 0 1 1])


end

