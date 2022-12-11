before_ica_open;
after_ica_open;
sampling_rate=256;
increments=1/(sampling_rate);
t=0:increments:5;
size_t=size(t);
matrix_before_ica_open=before_ica_open(1,1:size_t(1,2));
matrix_after_ica_open=after_ica_open(1,1:size_t(1,2));

matrix_before_ica12_open=before_ica_open(12,1:size_t(1,2));
matrix_after_ica12_open=after_ica_open(12,1:size_t(1,2));

figure
grid on

subplot(2,2,1)
plot(t,matrix_before_ica_open)
title('Data plot before ICA')

subplot(2,2,2)
plot(t,matrix_after_ica_open)
title('Data plot after ICA')

subplot(2,2,3)
plot(t,matrix_before_ica12_open)
title('Data plot before ICA, electrode 12')

subplot(2,2,4)
plot(t,matrix_after_ica12_open)
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




load('Loc.mat')

figure %7
subplot(3,2,1)
topoplot(Power1,Loc)
title('Delta open eyes topogrophy')
set(gca,'Clim',[min(Power1),max(Power1)])

subplot(3,2,2)
topoplot(Power2,Loc)
title('Theta open eyes topogrophy')
set(gca,'Clim',[min(Power2),max(Power2)])

subplot(3,2,3)
topoplot(Power3,Loc)
title('Alpha open eyes topogrophy')
set(gca,'Clim',[min(Power3),max(Power3)])

subplot(3,2,4)
topoplot(Power4,Loc)
title('Beta open eyes topogrophy')
set(gca,'Clim',[min(Power4),max(Power4)])

subplot(3,2,5)
topoplot(Power5,Loc)
title('Gamma open eyes topogrophy')
set(gca,'Clim',[min(Power5),max(Power5)])



dlmwrite('Open_pw1.txt',Power1)
dlmwrite('Open_pw2.txt',Power2)
dlmwrite('Open_pw3.txt',Power3)
dlmwrite('Open_pw4.txt',Power4)
dlmwrite('Open_pw5.txt',Power5)