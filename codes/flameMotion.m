clear
clc

%% Use webcam
cam=webcam;
cam.Resolution='1280x720'

%% initialise
img1 = snapshot(cam);
%     image(img1);
    pause(0.2)
    img2 = snapshot(cam);
%     image(img2);
    pause(0.2)
    img3 = snapshot(cam);
    image(img3);
    pause(0.2)
FTD=; 
%%
while(1)
    Fire1=YcbCr(img1);
%     Fire1=HSV(img1);
    Fire2=YcbCr(img2);
%     Fire2=HSV(img1);
    Fire3=YcbCr(img3);
%     Fire3=HSV(img3);
FD0=abs(Fire2-Fire1);
FD1=abs(Fire3-Fire2);

end

RGB = imread('fire10.jpg');
Fire=YcbCr(img)
FD=