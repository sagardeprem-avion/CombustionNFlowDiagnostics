function [Rall, FireMask,p]=HSV_alias(img,Rt)

RGB    = img;
HSV    = rgb2hsv(RGB);
R      = RGB(:,:,1);
G      = RGB(:,:,2);
B      = RGB(:,:,3);
H      = HSV(:,:,1);
S      = HSV(:,:,2);
V      = HSV(:,:,3);
k      = double((255-R));

% calculate sauration threshold
imagDum        = img;
imagDum(:,:,1) = Rt;
HSVdum         = rgb2hsv(imagDum);
St             = HSVdum(:,:,2);

% decision rules
R1     = ge(R,Rt)  ; 
R2     = and(ge(R,G),gt(G,B));
R3     = ge(S,k.*St/Rt) ;

Rall      = and(R1,and(R2,R3));
Rx        = uint8(Rall);
[m n]     = size(Rx);
p         = sum(sum(Rx))*100/(m*n);     % percentage of fire pixels in picture

% Red      = Rx.*RGB(:,:,1);
% Green    = Rx.*RGB(:,:,2);
% Blue     = Rx.*RGB(:,:,3);
% FireMask = cat(3,Red,Green);
% FireMask = cat(3,FireMask,Blue);
FireMask = RGB.*repmat(Rx,[1,1,3]);

end
 