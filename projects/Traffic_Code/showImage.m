function [  ] = showImage( X )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m,n,d] = size(X);
figure('Units','pixels','Position',[100 100 n m])
image(X);
set(gca,'Position',[0 0 1 1])


end

