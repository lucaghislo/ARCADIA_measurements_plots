%% Author: Yannick Konstandin
% University of Bergamo: Master thesis Summer 2022
% arcadia testboard
% bandgap characterization (-40°C, 30°C, 70°C)
% Measurements of the Threshold and Noise distribution for different
% configs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot each temp in one window
% loading files
clear; 
clc;
close all;


TP1_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP1_TEMP_m40.csv');
TP2_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP2_TEMP_m40.csv');
TP3_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP3_TEMP_m40.csv');
TP4_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP4_TEMP_m40.csv');
TP5_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP5_TEMP_m40.csv');
TP6_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP6_TEMP_m40.csv');
TP7_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP7_TEMP_m40.csv');
TP8_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP8_TEMP_m40.csv');
TP9_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP9_TEMP_m40.csv');
TP10_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP10_TEMP_m40.csv');
TP11_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP11_TEMP_m40.csv');
TP12_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP12_TEMP_m40.csv');
TP13_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP13_TEMP_m40.csv');
TP14_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP14_TEMP_m40.csv');
TP15_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP15_TEMP_m40.csv');
TP16_m40 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP16_TEMP_m40.csv');

M40 = [TP1_m40 TP2_m40 TP3_m40 TP4_m40 TP5_m40 TP6_m40 TP7_m40 TP8_m40 TP9_m40 TP10_m40 TP11_m40 TP12_m40 TP13_m40 TP14_m40 TP15_m40 TP16_m40];


TP1_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP1_TEMP_30.csv');
TP2_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP2_TEMP_30.csv');
TP3_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP3_TEMP_30.csv');
TP4_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP4_TEMP_30.csv');
TP5_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP5_TEMP_30.csv');
TP6_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP6_TEMP_30.csv');
TP7_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP7_TEMP_30.csv');
TP8_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP8_TEMP_30.csv');
TP9_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP9_TEMP_30.csv');
TP10_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP10_TEMP_30.csv');
TP11_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP11_TEMP_30.csv');
TP12_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP12_TEMP_30.csv');
TP13_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP13_TEMP_30.csv');
TP14_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP14_TEMP_30.csv');
TP15_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP15_TEMP_30.csv');
TP16_30 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP16_TEMP_30.csv');

M30 = [TP1_30 TP2_30 TP3_30 TP4_30 TP5_30 TP6_30 TP7_30 TP8_30 TP9_30 TP10_30 TP11_30 TP12_30 TP13_30 TP14_30 TP15_30 TP16_30]

TP1_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP1_TEMP_70.csv');
TP2_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP2_TEMP_70.csv');
TP3_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP3_TEMP_70.csv');
TP4_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP4_TEMP_70.csv');
TP5_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP5_TEMP_70.csv');
TP6_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP6_TEMP_70.csv');
TP7_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP7_TEMP_70.csv');
TP8_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP8_TEMP_70.csv');
TP9_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP9_TEMP_70.csv');
TP10_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP10_TEMP_70.csv');
TP11_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP11_TEMP_70.csv');
TP12_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP12_TEMP_70.csv');
TP13_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP13_TEMP_70.csv');
TP14_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP14_TEMP_70.csv');
TP15_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP15_TEMP_70.csv');
TP16_70 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP16_TEMP_70.csv');

M70 = [TP1_70 TP2_70 TP3_70 TP4_70 TP5_70 TP6_70 TP7_70 TP8_70 TP9_70 TP10_70 TP11_70 TP12_70 TP13_70 TP14_70 TP15_70 TP16_70]

figure('Name','bandgap characterization','NumberTitle','off')
hold on
plot(TP1_m40(:,2), TP1_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue'); grid on, grid minor
plot(TP2_m40(:,2), TP2_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP3_m40(:,2), TP3_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP4_m40(:,2), TP4_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP5_m40(:,2), TP5_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP6_m40(:,2), TP6_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP7_m40(:,2), TP7_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP8_m40(:,2), TP8_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP9_m40(:,2), TP9_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP10_m40(:,2), TP10_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP11_m40(:,2), TP11_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP12_m40(:,2), TP12_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP13_m40(:,2), TP13_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP14_m40(:,2), TP14_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP15_m40(:,2), TP15_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP15_m40(:,2), TP15_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');

ylabel('bandgap [V]')
xlabel('Vin [V]')
title('Bandgab measurements at -40°C')
hold off

figure('Name','bandgap characterization','NumberTitle','off')
hold on
plot(TP1_30(:,2), TP1_30(:,4),"LineWidth",1.5,'Marker','.','Color','black'); grid on, grid minor
plot(TP2_30(:,2), TP2_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP3_30(:,2), TP3_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP4_30(:,2), TP4_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP5_30(:,2), TP5_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP6_30(:,2), TP6_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP7_30(:,2), TP7_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP8_30(:,2), TP8_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP9_30(:,2), TP9_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP10_30(:,2), TP10_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP11_30(:,2), TP11_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP12_30(:,2), TP12_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP13_30(:,2), TP13_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP14_30(:,2), TP14_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP15_30(:,2), TP15_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP16_30(:,2), TP16_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');

ylabel('bandgap [V]')
xlabel('Vin [V]')
title('Bandgab measurements at 30°C')
hold off

figure('Name','bandgap characterization','NumberTitle','off')
hold on
plot(TP1_70(:,2), TP1_70(:,4),"LineWidth",1.5,'Marker','.','Color','green'); grid on, grid minor
plot(TP2_70(:,2), TP2_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP3_70(:,2), TP3_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP4_70(:,2), TP4_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP5_70(:,2), TP5_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP6_70(:,2), TP6_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP7_70(:,2), TP7_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP8_70(:,2), TP8_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP9_70(:,2), TP9_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP10_70(:,2), TP10_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP11_70(:,2), TP11_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP12_70(:,2), TP12_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP13_70(:,2), TP13_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP14_70(:,2), TP14_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP15_70(:,2), TP15_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP16_70(:,2), TP16_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');

ylabel('bandgap [V]')
xlabel('Vin [V]')
title('Bandgab measurements at 70°C')
hold off

%% plot all temp in one window %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','bandgap characterization all','NumberTitle','off')
hold on

m40 = plot(TP1_m40(:,2), TP1_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue'); grid on, grid minor
plot(TP2_m40(:,2), TP2_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP3_m40(:,2), TP3_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP4_m40(:,2), TP4_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP5_m40(:,2), TP5_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP6_m40(:,2), TP6_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP7_m40(:,2), TP7_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP8_m40(:,2), TP8_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP9_m40(:,2), TP9_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP10_m40(:,2), TP10_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP11_m40(:,2), TP11_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP12_m40(:,2), TP12_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP13_m40(:,2), TP13_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP14_m40(:,2), TP14_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP15_m40(:,2), TP15_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP15_m40(:,2), TP15_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');

p30 = plot(TP1_30(:,2), TP1_30(:,4),"LineWidth",1.5,'Marker','.','Color','black'); grid on, grid minor
plot(TP2_30(:,2), TP2_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP3_30(:,2), TP3_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP4_30(:,2), TP4_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP5_30(:,2), TP5_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP6_30(:,2), TP6_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP7_30(:,2), TP7_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP8_30(:,2), TP8_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP9_30(:,2), TP9_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP10_30(:,2), TP10_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP11_30(:,2), TP11_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP12_30(:,2), TP12_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP13_30(:,2), TP13_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP14_30(:,2), TP14_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP15_30(:,2), TP15_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP16_30(:,2), TP16_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');

p70 = plot(TP1_70(:,2), TP1_70(:,4),"LineWidth",1.5,'Marker','.','Color','green'); grid on, grid minor
plot(TP2_70(:,2), TP2_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP3_70(:,2), TP3_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP4_70(:,2), TP4_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP5_70(:,2), TP5_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP6_70(:,2), TP6_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP7_70(:,2), TP7_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP8_70(:,2), TP8_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP9_70(:,2), TP9_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP10_70(:,2), TP10_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP11_70(:,2), TP11_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP12_70(:,2), TP12_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP13_70(:,2), TP13_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP14_70(:,2), TP14_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP15_70(:,2), TP15_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP16_70(:,2), TP16_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');

ylabel('bandgap [V]')
xlabel('Vin [V]')
legend([m40 p30 p70],'at -40°C','at 30°C','at 70°C')
legend('Location','north')
title('Bandgab measurements')
hold off

%%
% Subplots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','bandgap characterization','NumberTitle','off')
subplot(1,3,1)
hold on
plot(TP1_m40(:,2), TP1_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue'); grid on, grid minor
plot(TP2_m40(:,2), TP2_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP3_m40(:,2), TP3_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP4_m40(:,2), TP4_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP5_m40(:,2), TP5_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP6_m40(:,2), TP6_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP7_m40(:,2), TP7_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP8_m40(:,2), TP8_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP9_m40(:,2), TP9_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP10_m40(:,2), TP10_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP11_m40(:,2), TP11_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP12_m40(:,2), TP12_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP13_m40(:,2), TP13_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP14_m40(:,2), TP14_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP15_m40(:,2), TP15_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');
plot(TP15_m40(:,2), TP15_m40(:,4),"LineWidth",1.5,'Marker','.','Color','blue');

ylabel('bandgap [V]')
xlabel('Vin [V]')
title('Bandgab measurements at -40°C')
hold off

subplot(1,3,2)
hold on
plot(TP1_30(:,2), TP1_30(:,4),"LineWidth",1.5,'Marker','.','Color','black'); grid on, grid minor
plot(TP2_30(:,2), TP2_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP3_30(:,2), TP3_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP4_30(:,2), TP4_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP5_30(:,2), TP5_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP6_30(:,2), TP6_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP7_30(:,2), TP7_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP8_30(:,2), TP8_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP9_30(:,2), TP9_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP10_30(:,2), TP10_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP11_30(:,2), TP11_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP12_30(:,2), TP12_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP13_30(:,2), TP13_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP14_30(:,2), TP14_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP15_30(:,2), TP15_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');
plot(TP16_30(:,2), TP16_30(:,4),"LineWidth",1.5,'Marker','.','Color','black');

ylabel('bandgap [V]')
xlabel('Vin [V]')
title('Bandgab measurements at 30°C')
hold off

subplot(1,3,3)
hold on
plot(TP1_70(:,2), TP1_70(:,4),"LineWidth",1.5,'Marker','.','Color','green'); grid on, grid minor
plot(TP2_70(:,2), TP2_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP3_70(:,2), TP3_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP4_70(:,2), TP4_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP5_70(:,2), TP5_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP6_70(:,2), TP6_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP7_70(:,2), TP7_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP8_70(:,2), TP8_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP9_70(:,2), TP9_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP10_70(:,2), TP10_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP11_70(:,2), TP11_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP12_70(:,2), TP12_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP13_70(:,2), TP13_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP14_70(:,2), TP14_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP15_70(:,2), TP15_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');
plot(TP16_70(:,2), TP16_70(:,4),"LineWidth",1.5,'Marker','.','Color','green');

ylabel('bandgap [V]')
xlabel('Vin [V]')
title('Bandgab measurements at 70°C')
hold off

%% Plot all outputs with legend %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all

figure('Name','bandgap characterization','NumberTitle','off')
hold on
plot(TP1_m40(:,2), TP1_m40(:,4),"LineWidth",1.5,'Marker','.', 'Color', [0, 0, 0]); grid on, grid minor
plot(TP2_m40(:,2), TP2_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0, 0.5]);
plot(TP3_m40(:,2), TP3_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0, 1]);
plot(TP4_m40(:,2), TP4_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0.5,1]);
plot(TP5_m40(:,2), TP5_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 1, 1]);
plot(TP6_m40(:,2), TP6_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0.5, 0]);
plot(TP7_m40(:,2), TP7_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 1, 0]);
plot(TP8_m40(:,2), TP8_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0, 0]);
plot(TP9_m40(:,2), TP9_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0, 0],'LineStyle','--');
plot(TP10_m40(:,2), TP10_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0.5, 0], 'LineStyle','--');
plot(TP11_m40(:,2), TP11_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 1, 0],'LineStyle','--');
plot(TP12_m40(:,2), TP12_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0, 0.5],'LineStyle','--');
plot(TP13_m40(:,2), TP13_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0, 1],'LineStyle','--');
plot(TP14_m40(:,2), TP14_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0.5, 0.5],'LineStyle','--');
plot(TP15_m40(:,2), TP15_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0.5, 1],'LineStyle','--');
plot(TP15_m40(:,2), TP15_m40(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0, 0.5],'LineStyle','--');

ylabel('bandgap [V]')
xlim([0 1.32])
xlabel('Vin [V]')

labels=num2str((1:16).','TP%d');
legend(labels)
legend('Location','northwest')
title('Bandgab measurements at -40°C')
hold off

figure('Name','bandgap characterization','NumberTitle','off')
hold on
plot(TP1_30(:,2), TP1_30(:,4),"LineWidth",1.5,'Marker','.', 'Color', [0, 0, 0]); grid on, grid minor
plot(TP2_30(:,2), TP2_30(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0, 0.5]);
plot(TP3_30(:,2), TP3_30(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0, 1]);
plot(TP4_30(:,2), TP4_30(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0.5,1]);
plot(TP5_30(:,2), TP5_30(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 1, 1]);
plot(TP6_30(:,2), TP6_30(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0.5, 0]);
plot(TP7_30(:,2), TP7_30(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 1, 0]);
plot(TP8_30(:,2), TP8_30(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0, 0]);
plot(TP9_30(:,2), TP9_30(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0, 0],'LineStyle','--');
plot(TP10_30(:,2), TP10_30(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0.5, 0], 'LineStyle','--');
plot(TP11_30(:,2), TP11_30(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 1, 0],'LineStyle','--');
plot(TP12_30(:,2), TP12_30(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0, 0.5],'LineStyle','--');
plot(TP13_30(:,2), TP13_30(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0, 1],'LineStyle','--');
plot(TP14_30(:,2), TP14_30(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0.5, 0.5],'LineStyle','--');
plot(TP15_30(:,2), TP15_30(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0.5, 1],'LineStyle','--');
plot(TP15_30(:,2), TP15_30(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0, 0.5],'LineStyle','--');

ylabel('bandgap [V]')
xlim([0 1.32])
xlabel('Vin [V]')

labels=num2str((1:16).','TP%d');
legend(labels)
legend('Location','northwest')
title('Bandgab measurements at 30°C')
hold off


figure('Name','bandgap characterization','NumberTitle','off')
hold on
TP=num2str(1','TP%d_m40(:,2)');
plot(TP1_70(:,2), TP1_70(:,4),"LineWidth",1.5,'Marker','.', 'Color', [0, 0, 0]); grid on, grid minor
plot(TP2_70(:,2), TP2_70(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0, 0.5]);
plot(TP3_70(:,2), TP3_70(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0, 1]);
plot(TP4_70(:,2), TP4_70(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0.5,1]);
plot(TP5_70(:,2), TP5_70(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 1, 1]);
plot(TP6_70(:,2), TP6_70(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 0.5, 0]);
plot(TP7_70(:,2), TP7_70(:,4),"LineWidth",1.5,'Marker','.','Color', [0, 1, 0]);
plot(TP8_70(:,2), TP8_70(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0, 0]);
plot(TP9_70(:,2), TP9_70(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0, 0],'LineStyle','--');
plot(TP10_70(:,2), TP10_70(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0.5, 0], 'LineStyle','--');
plot(TP11_70(:,2), TP11_70(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 1, 0],'LineStyle','--');
plot(TP12_70(:,2), TP12_70(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0, 0.5],'LineStyle','--');
plot(TP13_70(:,2), TP13_70(:,4),"LineWidth",1.5,'Marker','.','Color', [1, 0, 1],'LineStyle','--');
plot(TP14_70(:,2), TP14_70(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0.5, 0.5],'LineStyle','--');
plot(TP15_70(:,2), TP15_70(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0.5, 1],'LineStyle','--');
plot(TP15_70(:,2), TP15_70(:,4),"LineWidth",1.5,'Marker','.','Color', [0.5, 0, 0.5],'LineStyle','--');

ylabel('bandgap [V]')
xlim([0 1.32])
xlabel('Vin [V]')

labels=num2str((1:16).','TP%d');
legend(labels)
legend('Location','northwest')
title('Bandgab measurements at 70°C')
hold off

%% Fit measurement in 1.08-1.32V %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all
start = 110;
ende = 134;
color = jet(17);
figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
j = 1;
for i=4:5:79
    if j <= 8
    plot(M40(start:ende,2),M40(start:ende,i),"LineWidth",1.5,'Marker','o','Color',color(j,:));
    j = j + 1;
    else
    plot(M40(start:ende,2),M40(start:ende,i),"LineWidth",1.5,'Marker','+','LineStyle','--','Color', color(j,:));
    j = j + 1;
    end
end
ylabel('bandgap [V]')
xlabel('Vin [V]')
xlim([1.08 1.32])
labels=num2str((1:16).','TP%d');
legend(labels)
legend('Location','northwest')
title('Bandgab measurements at -40°C')
hold off

figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
j = 1;
for i=4:5:79
    if j <= 8
    plot(M30(start:ende,2),M30(start:ende,i),"LineWidth",1.5,'Marker','o','Color',color(j,:));
    j = j + 1;
    else
    plot(M30(start:ende,2),M30(start:ende,i),"LineWidth",1.5,'Marker','+','LineStyle','--','Color', color(j,:));
    j = j + 1;
    end
end
ylabel('bandgap [V]')
xlabel('Vin [V]')
xlim([1.08 1.32])
labels=num2str((1:16).','TP%d');
legend(labels)
legend('Location','southeast')
title('Bandgab measurements at 30°C')
hold off

figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
j = 1;
for i=4:5:79
    if j <= 8
    plot(M70(start:ende,2),M70(start:ende,i),"LineWidth",1.5,'Marker','o','Color',color(j,:));
    j = j + 1;
    else
    plot(M70(start:ende,2),M70(start:ende,i),"LineWidth",1.5,'Marker','+','LineStyle','--','Color', color(j,:));
    j = j + 1;
    end
end
ylabel('bandgap [V]')
xlabel('Vin [V]')
xlim([1.08 1.32])
labels=num2str((1:16).','TP%d');
legend(labels)
legend('Location','southeast')
title('Bandgab measurements at 70°C')
hold off

%% Histofit 1.2V
clc
close all

M40_12 = [];
j = 1;
for k=4:5:79
    M40_12(j,1) = M40(122, k);
    disp(M40_12)
    j = j + 1;
end


%% measurement VDDA 0-1,32V and VDDA 1,32V-0V

clc;
close all;

% loading files
TP1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP1_TEMP_30_VCC2_5_0to133.csv');
TP2 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP2_TEMP_30_VCC2_5_0to133.csv');
TP3 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP3_TEMP_30_VCC2_5_0to133.csv');
TP4 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP4_TEMP_30_VCC2_5_0to133.csv');
TP5 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP5_TEMP_30_VCC2_5_0to133.csv');
TP6 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP6_TEMP_30_VCC2_5_0to133.csv');
TP7 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP7_TEMP_30_VCC2_5_0to133.csv');
TP8 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP8_TEMP_30_VCC2_5_0to133.csv');
TP9 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP9_TEMP_30_VCC2_5_0to133.csv');
TP10 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP10_TEMP_30_VCC2_5_0to133.csv');
TP11 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP11_TEMP_30_VCC2_5_0to133.csv');
TP12 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP12_TEMP_30_VCC2_5_0to133.csv');
TP13 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP13_TEMP_30_VCC2_5_0to133.csv');
TP14 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP14_TEMP_30_VCC2_5_0to133.csv');
TP15 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP15_TEMP_30_VCC2_5_0to133.csv');
TP16 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP16_TEMP_30_VCC2_5_0to133.csv');

TP1_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP1_TEMP_30_VCC2_5_133to0.csv');
TP2_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP2_TEMP_30_VCC2_5_133to0.csv');
TP3_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP3_TEMP_30_VCC2_5_133to0.csv');
TP4_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP4_TEMP_30_VCC2_5_133to0.csv');
TP5_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP5_TEMP_30_VCC2_5_133to0.csv');
TP6_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP6_TEMP_30_VCC2_5_133to0.csv');
TP7_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP7_TEMP_30_VCC2_5_133to0.csv');
TP8_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP8_TEMP_30_VCC2_5_133to0.csv');
TP9_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP9_TEMP_30_VCC2_5_133to0.csv');
TP10_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP10_TEMP_30_VCC2_5_133to0.csv');
TP11_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP11_TEMP_30_VCC2_5_133to0.csv');
TP12_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP12_TEMP_30_VCC2_5_133to0.csv');
TP13_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP13_TEMP_30_VCC2_5_133to0.csv');
TP14_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP14_TEMP_30_VCC2_5_133to0.csv');
TP15_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP15_TEMP_30_VCC2_5_133to0.csv');
TP16_1 = readmatrix('C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Band_gap\Results_TP16_TEMP_30_VCC2_5_133to0.csv');

TP_0_to = [TP1 TP2 TP3  TP4 TP5 TP6 TP7 TP8 TP9 TP10 TP11 TP12 TP13 TP14 TP15 TP16];
TP_132_to = [TP1_1 TP2_1 TP3_1 TP4_1 TP5_1 TP6_1 TP7_1 TP8_1 TP9_1 TP10_1 TP11_1 TP12_1 TP13_1 TP14_1 TP15_1 TP16_1];

color = jet(17);
figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on

j = 1;
for i=4:6:96
    if j <= 8
        plot(TP_0_to(:,2),TP_0_to(:,i),"LineWidth",1.5,'Marker','o','Color',color(j,:));
        j = j + 1;
    else
        plot(TP_0_to(:,2),TP_0_to(:,i),"LineWidth",1.5,'Marker','+','LineStyle','--','Color', color(j,:));
        j = j + 1;
    end
end

ylabel('bandgap [V]')
xlabel('Vin [V]')
xlim([0 1.32])
labels=num2str((1:16).','TP%d');
legend(labels)
legend('Location','northwest')
title('Bandgab measurements VDDA from 0V-1,32V at 30°C')
hold off

color = jet(17);
figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
range = 2:134;
j = 1;
for i=4:6:96
    if j <= 8
        plot(TP_132_to(:,2),TP_132_to(:,i),"LineWidth",1.5,'Marker','o','Color',color(j,:));
        j = j + 1;
    else
        plot(TP_132_to(:,2),TP_132_to(:,i),"LineWidth",1.5,'Marker','+','LineStyle','--','Color', color(j,:));
        j = j + 1;
    end
end

ylabel('bandgap [V]')
xlabel('Vin [V]')
xlim([0 1.32])
labels=num2str((1:16).','TP%d');
legend(labels)
legend('Location','northwest')
title('Bandgab measurements VDDA from 1,32V-0V at 30°C')
hold off









