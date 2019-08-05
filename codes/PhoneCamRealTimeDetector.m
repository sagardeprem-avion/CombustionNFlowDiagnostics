clear
clc

%% 

cam             = webcam('DroidCam') ;
% cam.Resolution  = '1280x720';
tau   = 40 ;     % threshold for YCbCr to be calibrated 
Rt    = 40 ;     % threshold for Rt to be calibrated
k     = zeros(1,20) ;
E     = linspace(1,20,20) ;
Eddot = logspace(1,20,20);
Et    = 100;   % threshold for motion to be calibrated, 
% Can be used to calibrate sensitivity

url = 'http://192.168.0.100:8080/shot.jpg';


while(1)
 
    img  =  snapshot(cam);
% img = imread(url);
    %%
    subplot(3,2,1)
    imshow(img);
    [BW, FireMask,p]  = YCbCr_alias(img,tau) ;
%     [BW, FireMask,p]=HSV_alias(img,Rt) ;
 
    %%
    subplot(3,2,3) 
    imshow(BW)
    title('Fire pixels')
    
    subplot(3,2,5) 
    imshow(FireMask)
    title('Masked fire image')
    %%
    k = [k p];
    e = (entropy(FireMask(:,:,1))+entropy(FireMask(:,:,2))+entropy(FireMask(:,:,3)))/3;
    E=[E e];
    
    subplot(3,2,2)
    plot(k(end-20:end))
    title('Percentage of growing fire area')
    
    subplot(3,2,4)
    plot(E(end-20:end))
    title('Entropy')
    
    Edot = diff(E);
    Eddot=abs(diff(Edot)./Edot(1:end-1));
   
    subplot(3,2,6)
    plot(Eddot(end-18:end))
    title('Entropy change rate wrt change')
    
   if ge(max(Eddot(end-10:end)),Et)
       fprintf('Fire Detected !!!\n')
%        fprintf('Percentage of potentially under fire : %d !\n')
        WarnWave = [sin(1:2:2000) ];
        Audio = audioplayer(WarnWave, 17000);
        play(Audio);
        
        ax1 = axes('Position',[0 0 1 1],'Visible','off');
        axes(ax1) % sets ax1 to current axes
        
        text(.025,0.6,'FIRE DETECTED!!  ')
        text(.025,0.55, sprintf(' %2.2d %% area potentially under fire ',k(end)*100))

   end
end

 