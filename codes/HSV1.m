% function Fire=HSV(img)

RGB = imread('snaps/100.png');
% RGB=img;
HSV = rgb2hsv(RGB);
R=RGB(:,:,1);
G=RGB(:,:,2);
B=RGB(:,:,3);
H=HSV(:,:,1);
S=HSV(:,:,2);
V=HSV(:,:,3);
Rt=90;
St=105;
R1=uint8(ge(R,Rt))  ; 
R2=uint8(and(ge(R,G),gt(G,B)));
R3=uint8(ge(S,(255-R)*St/Rt)) ;

Rall=uint8(and(R1,and(R2,R3)));
Red=Rall.*RGB(:,:,1);
Green=Rall.*RGB(:,:,2);
Blue=Rall.*RGB(:,:,3);
Fire=cat(3,Red,Green);
Fire=cat(3,Fire,Blue);
% 
% figure
% imshow(Fire);

% end
 