clear
clc

%% Use webcam
cam=webcam;
cam.Resolution='1280x720'
% preview(cam)
% 
% for idx = 1:5
while(1)
    img = snapshot(cam);
    image(img);
 
%     Fire=YcbCr(img);
    Fire=HSV(img);
    imshow(Fire)
end

%% Create the VideoWriter object to open an AVI file for writing
% 
% vidWriter = VideoWriter('frames.avi');
% open(vidWriter);
% 
% for index = 1:20
%     % Acquire frame for processing
%     img = snapshot(cam);
% 
%     % Write frame to video
%     writeVideo(vidWriter, img);
% end
% %% Use phonecam
% 
% phoneCam
%  
% for idx = 1:5
%     img = snapshot(phoneCam);
%     image(img);
% end