before_ica;
after_ica;
sampling_rate=256;
increments=1/(sampling_rate);
t=0:increments:5;
size_t=size(t);
matrix_before_ica=before_ica(1,1:size_t(1,2));
matrix_after_ica=after_ica(1,1:size_t(1,2));

matrix_before_ica12=before_ica(12,1:size_t(1,2));
matrix_after_ica12=after_ica(12,1:size_t(1,2));

figure
grid on

subplot(2,2,1)
plot(t,matrix_before_ica)
title('Data plot before ICA')

subplot(2,2,2)
plot(t,matrix_after_ica)
title('Data plot after ICA')

subplot(2,2,3)
plot(t,matrix_before_ica12)
title('Data plot before ICA, electrode 12')

subplot(2,2,4)
plot(t,matrix_after_ica12)
title('Data plot after ICA, electrode 12')


%% after your ICA, this code can help you to filter your data into 5 different frequency bands
final_data = EEG.data;
EEG = pop_eegfiltnew(EEG, 0.5,4,2816,0,[],0);
fb1 = EEG.data;
EEG.data = final_data;
EEG = pop_eegfiltnew(EEG, 4,7,424,0,[],0);
fb2 = EEG.data;
EEG.data = final_data;
EEG = pop_eegfiltnew(EEG, 8,13,424,0,[],0);
fb3 = EEG.data;
EEG.data = final_data;
EEG = pop_eegfiltnew(EEG, 12,30,260,0,[],0);
fb4 = EEG.data;
EEG.data = final_data;
EEG = pop_eegfiltnew(EEG, 30,70,114,0,[],0);
fb5 = EEG.data;

Power1=rms(fb1,2);
Power2=rms(fb2,2);
Power3=rms(fb3,2);
Power4=rms(fb4,2);
Power5=rms(fb5,2);


figure %2
subplot(3,2,1)
plot(Power1)
title('Delta amplitude')

subplot(3,2,2)
plot(Power2)
title('Theta amplitude')

subplot(3,2,3)
plot(Power3)
title('Alpha amplitude')

subplot(3,2,4)
plot(Power4)
title('Beta amplitude')

subplot(3,2,5)
plot(Power5)
title('Gamma amplitude')



% figure %3
% subplot(3,2,1)
% plot(fb1_close_mean)
% title('Delta amplitude:close mean')
% 
% subplot(3,2,2)
% plot(fb2_close_mean)
% title('Theta amplitude:close mean')
% 
% subplot(3,2,3)
% plot(fb3_close_mean)
% title('Alpha amplitude:close mean')
% 
% subplot(3,2,4)
% plot(fb4_close_mean)
% title('Beta amplitude:close mean')
% 
% subplot(3,2,5)
% plot(fb5_close_mean)
% title('Gamma amplitude:close mean')
% 
% figure %4
% subplot(3,2,1)
% plot(fb1_open_mean)
% title('Delta amplitude:open mean')
% 
% subplot(3,2,2)
% plot(fb2_close_mean)
% title('Theta amplitude:close mean')
% 
% subplot(3,2,3)
% plot(fb3_open_mean)
% title('Alpha amplitude:open mean')
% 
% subplot(3,2,4)
% plot(fb4_open_mean)
% title('Beta amplitude:open mean')
% 
% subplot(3,2,5)
% plot(fb5_open_mean)
% title('Gamma amplitude:open mean')

load('Loc.mat')
figure %5  

subplot(3,2,1)
topoplot(fb1_close_mean,Loc)
title('Delta close-mean topogrophy')
set(gca,'Clim',[min(fb1_close_mean),max(fb1_close_mean)])

subplot(3,2,2)
topoplot(fb2_close_mean,Loc)
title('Theta close-mean topogrophy')
set(gca,'Clim',[min(fb2_close_mean),max(fb2_close_mean)])

subplot(3,2,3)
topoplot(fb3_close_mean,Loc)
title('Alpha close-mean topogrophy')
set(gca,'Clim',[min(fb3_close_mean),max(fb3_close_mean)])

subplot(3,2,4)
topoplot(fb4_close_mean,Loc)
title('Beta close-mean topogrophy')
set(gca,'Clim',[min(fb4_close_mean),max(fb4_close_mean)])

subplot(3,2,5)
topoplot(fb5_close_mean,Loc)
title('Gamma close-mean topogrophy')
set(gca,'Clim',[min(fb5_close_mean),max(fb5_close_mean)])

figure %6
subplot(3,2,1)
topoplot(fb1_open_mean,Loc)
title('Delta open-mean topogrophy')
set(gca,'Clim',[min(fb1_open_mean),max(fb1_open_mean)])

subplot(3,2,2)
topoplot(fb2_open_mean,Loc)
title('Theta open-mean topogrophy')
set(gca,'Clim',[min(fb2_open_mean),max(fb2_open_mean)])

subplot(3,2,3)
topoplot(fb3_open_mean,Loc)
title('Alpha open-mean topogrophy')
set(gca,'Clim',[min(fb3_open_mean),max(fb3_open_mean)])

subplot(3,2,4)
topoplot(fb4_open_mean,Loc)
title('Beta open-mean topogrophy')
set(gca,'Clim',[min(fb4_open_mean),max(fb4_open_mean)])

subplot(3,2,5)
topoplot(fb5_open_mean,Loc)
title('Gamma open-mean topogrophy')
set(gca,'Clim',[min(fb5_open_mean),max(fb5_open_mean)])



%Subtraction of open and close mean brainwaves
fb_11=fb1_close_mean-fb1_open_mean;
fb_22=fb2_close_mean-fb2_open_mean;
fb_33=fb3_close_mean-fb3_open_mean;
fb_44=fb4_close_mean-fb4_open_mean;
fb_55=fb5_close_mean-fb5_open_mean;

figure %6
subplot(3,2,1)
topoplot(fb_11,Loc)
title('Delta difference topogrophy')
set(gca,'Clim',[min(fb_11),max(fb_11)])


subplot(3,2,2)
topoplot(fb_22,Loc)
title('Theta difference topogrophy')
set(gca,'Clim',[min(fb_22),max(fb_22)])

subplot(3,2,3)
topoplot(fb_33,Loc)
title('Alpha difference topogrophy')
set(gca,'Clim',[min(fb_33),max(fb_33)])


subplot(3,2,4)
topoplot(fb_44,Loc)
title('Beta difference topogrophy')
set(gca,'Clim',[min(fb_44),max(fb_44)])


subplot(3,2,5)
topoplot(fb_55,Loc)
title('Gamma difference topogrophy')
set(gca,'Clim',[min(fb_55),max(fb_55)])

figure %7
subplot(3,2,1)
topoplot(Power1,Loc)
title('Delta closed eyes topogrophy')
set(gca,'Clim',[min(Power1),max(Power1)])

subplot(3,2,2)
topoplot(Power2,Loc)
title('Theta closed eyes topogrophy')
set(gca,'Clim',[min(Power2),max(Power2)])


subplot(3,2,3)
topoplot(Power3,Loc)
title('Alpha closed eyes topogrophy')
set(gca,'Clim',[min(Power3),max(Power3)])


subplot(3,2,4)
topoplot(Power4,Loc)
title('Beta closed eyes topogrophy')
set(gca,'Clim',[min(Power4),max(Power4)])


subplot(3,2,5)
topoplot(Power5,Loc)
title('Gamma closed eyes topogrophy')
set(gca,'Clim',[min(Power5),max(Power5)])


% 
% dlmwrite('Closed_pw1.txt',Power1)
% dlmwrite('Closed_pw2.txt',Power2)
% dlmwrite('Closed_pw3.txt',Power3)
% dlmwrite('Closed_pw4.txt',Power4)
% dlmwrite('Closed_pw5.txt',Power5)