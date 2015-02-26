function [ files ] = get_pic_names( fin )
%get_pic_names Summary of this function goes here
%   fin - the folder of pictures you wish to evaluate
%   returns a vector of sctructs
%       name
%       date
%       bytes
%       isdir
%       datenum

    files = dir(fin);
    

end

