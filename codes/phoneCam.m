function phoneCam

% Use IP camera android app. Go to the last and tap start server
% Copy the Ip address below

url = 'http://192.168.0.100:8080/shot.jpg';
% ss  = imread(url);
ss  = snapshot(url);

fh = image(ss);

    while(1)
        ss  = imread(url);
        set(fh,'CData',ss);
        drawnow;
    end
    
end