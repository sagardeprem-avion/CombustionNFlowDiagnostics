mov = VideoReader('videos/vid1.MKV');
vidFrames = read(mov);

for frame = 1 : size(vidFrames, 4)
    outputBaseFileName = sprintf('%3.3d.png', frame);
    outputFullFileName = fullfile(outputFolder, outputBaseFileName);
    imwrite( vidFrames(:,:,:,frame), outputFullFileName, 'png');
end