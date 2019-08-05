% video fire detector

n = mov.NumberOfFrames;
E = [];

 figure
for i=1:n
   img =imread(sprintf('snaps%d/%3.3d.png',j, i));
%    [~, FireMask,~]=HSV_alias(img,80);
   [~, FireMask,~]=YCbCr_alias(img,40);
   e = (entropy(FireMask(:,:,1))+entropy(FireMask(:,:,2))+entropy(FireMask(:,:,3)))/3;
   image(FireMask)
   print(sprintf('snaps%d/FireMask%3.3d',j,i),'-dpng')
   E = [E e]; 
   fprintf('Finished frame %d\n', i)
end

figure
plot([1:n],E,'black')
title('Image entropy')
ylabel('E')
xlabel('Frames')
print(sprintf('snaps%d/Image entropy',j),'-depsc')

figure 
Edot = diff(E);
plot([1:n-1],Edot,'black')
title('Image entropy difference')
ylabel('\DeltaE')
xlabel('Frames')
print(sprintf('snaps%d/Image entropy difference',j),'-depsc')

 
figure 
Eddot=abs(diff(Edot)./Edot(1:end-1));
plot([1:n-2],Eddot,'black')
ylabel('$\frac{\Delta(\Delta E)}{\Delta E}$','Interpreter','latex')
xlabel('Frames')
title('Change in the entropy difference w.r.t. difference')
print(sprintf('snaps%d/Image entropy second derivative',j),'-depsc')

deb = sprintf('snaps%d/data',j)
save 'deb.mat' Edot Eddot