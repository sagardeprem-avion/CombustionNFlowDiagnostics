% Access an image acquisition device.
vidobj = videoinput(webcam, 1);

% Configure the number of frames to log.
vidobj.FramesPerTrigger = 50;

% Skip the first few frames the device provides
% before logging data.
vidobj.TriggerFrameDelay = 5;

% Access the device's video source.
src = getselectedsource(vidobj);

% Determine the device specific frame rates (frames per second) available.
frameRates = set(src, 'FrameRate')