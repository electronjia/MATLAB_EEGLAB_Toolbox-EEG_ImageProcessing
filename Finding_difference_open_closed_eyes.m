load('Open_pw1.txt');
load('Open_pw2.txt');
load('Open_pw3.txt');
load('Open_pw4.txt');
load('Open_pw5.txt');

load('Closed_pw1.txt'); 
load('Closed_pw2.txt');
load('Closed_pw3.txt'); 
load('Closed_pw4.txt'); 
load('Closed_pw5.txt'); 

Pw1=Open_pw1-Closed_pw1;
Pw2=Open_pw2-Closed_pw2;
Pw3=Open_pw3-Closed_pw3;
Pw4=Open_pw4-Closed_pw4;
Pw5=Open_pw5-Closed_pw5;


subplot(3,2,1)
topoplot(Pw1,Loc)
title('Delta open-closed difference eyes topogrophy')
set(gca,'Clim',[min(Pw1),max(Pw1)])

subplot(3,2,2)
topoplot(Pw2,Loc)
title('Theta open-closed difference eyes topogrophy')
set(gca,'Clim',[min(Pw2),max(Pw2)])


subplot(3,2,3)
topoplot(Pw3,Loc)
title('Alpha open-closed difference eyes topogrophy')
set(gca,'Clim',[min(Pw3),max(Pw3)])


subplot(3,2,4)
topoplot(Pw4,Loc)
title('Beta open-closed difference eyes topogrophy')
set(gca,'Clim',[min(Pw4),max(Pw4)])


subplot(3,2,5)
topoplot(Pw5,Loc)
title('Gamma open-closed difference eyes topogrophy')
set(gca,'Clim',[min(Pw5),max(Pw5)])

