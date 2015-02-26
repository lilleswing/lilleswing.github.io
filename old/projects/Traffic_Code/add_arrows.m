function [] = add_arrows(fin, fout, clusterlist)
%add_arrows Adds arrows to an image
%   fin - file name of picture to be added
%   fout - outfile of picture with arrows
%   p1 - list of 2 vectors of starting locations
%   p2 - list of 2 vectors of end locations
    pic = imread(fin);
    handle = imshow(pic);
    colors = {'b', 'g', 'r', 'm'};
    [row col] = size(clusterlist);
    for i = 1:row
        p1 = [round(clusterlist(i,4)) round(clusterlist(i,5))];
        dir = clusterlist(i,7);
        if(dir == 0)
            continue
        end
        if(dir == 1)
            p2 = p1 + [0,100];
        elseif(dir == 2)
            p2 = p1 + [0,-100];
        elseif(dir == 3)
            p2 = p1 + [-100,0];
        else
            p2 = p1 + [100,0];
        end
        arr = arrow(p1,p2);
        %disp(dir)
        if(dir ~= 0)
            set(arr,'FaceColor',colors{dir});
            set(arr,'EdgeColor',colors{dir});
        end
    end
    saveas(handle,fout);

end

