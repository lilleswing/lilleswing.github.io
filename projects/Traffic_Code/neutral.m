function [ newframe, thresh_im ] = neutral( frame, background, thresh )
%UNTITLED5 subtracts the background from the frame, and removes timestamp
%   input:
%   frame - the camera frame to subtract from (640x480x3)
%   background - the background image to subtract (640x480x3)
%   thresh - the minimum difference threshold (anything under threshold is
%   set to 0
%   output:
%   newframe - the edited image (640x480x3)
%   thresh_im - every pixel over the threshold = 1 (640x480x1) 

newframe = double((frame - background).^2);
%showImage(newframe);

%delete top
for x=1:640
    for y=1:50
        newframe(y,x,1) = 0;
        newframe(y,x,2) = 0;
        newframe(y,x,3) = 0;
    end
end
%delete top left
for x=1:640
    for y=1:100
        newframe(y,x,1) = 0;
        newframe(y,x,2) = 0;
        newframe(y,x,3) = 0;
    end
end
%delete bottom
for x=1:640
    for y=370:480
        newframe(y,x,1) = 0;
        newframe(y,x,2) = 0;
        newframe(y,x,3) = 0;
    end
end

thresh_im = ones(480,640);
for x=1:640
    for y=1:480
        if (newframe(y,x,1) + newframe(y,x,2) + newframe(y,x,3)) < thresh
            newframe(y,x,1) = 0;
            newframe(y,x,2) = 0;
            newframe(y,x,3) = 0;
            thresh_im(y,x) = 0;
        end
    end
end

end

