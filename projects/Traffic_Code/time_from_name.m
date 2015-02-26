function [ dv ] = time_from_name( filename )
%time_from_name get the time from a filename of a picture
%   Parses filename of a picture and returns a datenum
%   filename - the filename of the picture you want the time for

    dv = [2011 10 10];
    t1 = sscanf(filename, '%d');
    sec = mod(t1,100);
    t1 = (t1-sec)/100;
    min = mod(t1,100);
    t1 = (t1-min)/100;
    hour = mod(t1,100);
    t = [hour min sec];
    dv = [dv  t];
    dv = datenum(dv);
    
end

