% function Fire=YcbCr(img)

RGB = imread('images/fire20.jpg');
% RGB=img;
YCBCR = rgb2ycbcr(RGB);

% figure
% imshow(RGB);
% title('Image in RGB Color Space');

% figure
% imshow(YCBCR);
% title('Image in YCbCr Color Space');

tau =0;

Y=YCBCR(:,:,1);
CB=double(YCBCR(:,:,2));
CR=double(YCBCR(:,:,3));
Ycap=mean(mean(Y));
CBcap=mean(mean(CB));
CRcap=mean(mean(CR));

R1=(ge(Y,CB))  ; 
R2=(ge(CR,CB)) ;
R3=(and(ge(Y,Ycap),and(ge(CBcap,CB),ge(CR,CRcap))));
R4=(ge(abs(CB-CR),tau));

f1=-2.62*10^(-10)*CR.^7+3.27*10^(-7)*CR.^6-1.75*10^(-4)*CR.^5+5.16*10^(-2)*CR.^4-9.10*CR.^3-5.60*10^4*CR + 1.40*10^6;
f2=-6.77e-8*CR.^5+5.50e-5*CR.^4-1.76e-2*CR.^3+2.78*CR.^2-2.15e2*CR + 6.62e3;
f3=1.80e-4*CR.^4-1.02e-1*CR.^3+21.66*CR.^2-2.05e3*CR + 7.29e4;

R5=(and(ge(CB,f1),and(ge(f3,CB),ge(f2,CB))));

 
% Rall=(and(R1,and(R2,and(R3,and(R4,R5)))));
Rall=(and(R1,and(R2,and(R3,R4)))); 
% Rall=(and(R1,and(R2,R3)));
% Rall=(and(R3,R1));
% Rall=R5; 

 
Red=uint8(Rall).*RGB(:,:,1);
Green=uint8(Rall).*RGB(:,:,2);
Blue=uint8(Rall).*RGB(:,:,3);
Fire=cat(3,Red,Green);
Fire=cat(3,Fire,Blue);
% 
figure
subplot(1,3,1)
imshow(RGB);
subplot(1,3,2)
imshow(Fire);
subplot(1,3,3)
imshow(Rall)

% end

