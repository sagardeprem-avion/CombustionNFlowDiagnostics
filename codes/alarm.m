function alarm
% WarnWave = [sin(1:0.6:5000), cos(1:0.3:5000), sin(1:0.6:5000)];
WarnWave = [sin(1:0.9:5000) ];

Audio = audioplayer(WarnWave, 17000);
play(Audio);
end