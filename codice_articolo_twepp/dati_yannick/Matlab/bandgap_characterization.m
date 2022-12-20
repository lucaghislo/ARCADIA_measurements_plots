%% Author: Yannick Konstandin
% University of Bergamo
% Professor Traversi
% arcadia testboard
% bandgap characterization (-40°C to 70°C)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
close all;

% read csv files

for i=1:16
  dm40=dir("Results_TP"+i+"_REG_m40.csv");   
  xm40=readmatrix(dm40(1).name);
  eval(['TP' num2str(i) '_m40=xm40']);

  dm30=dir("Results_TP"+i+"_REG_m30.csv");  
  xm30=readmatrix(dm30(1).name);
  eval(['TP' num2str(i) '_m30=xm30']);

  dm20=dir("Results_TP"+i+"_REG_m20.csv");  
  xm20=readmatrix(dm20(1).name);
  eval(['TP' num2str(i) '_m20=xm20']);

  dm10=dir("Results_TP"+i+"_REG_m10.csv");  
  xm10=readmatrix(dm10(1).name);
  eval(['TP' num2str(i) '_m10=xm10']);

  d0=dir("Results_TP"+i+"_REG_0.csv");  
  x0=readmatrix(d0(1).name);
  eval(['TP' num2str(i) '_0=x0']);

  d10=dir("Results_TP"+i+"_REG_10.csv");  
  x10=readmatrix(d10(1).name);
  eval(['TP' num2str(i) '_10=x10']);

  d20=dir("Results_TP"+i+"_REG_20.csv");  
  x20=readmatrix(d20(1).name);
  eval(['TP' num2str(i) '_20=x20']);

  d30=dir("Results_TP"+i+"_REG_30.csv");  
  x30=readmatrix(d30(1).name);
  eval(['TP' num2str(i) '_30=x30']);
 
  d40=dir("Results_TP"+i+"_REG_40.csv");  
  x40=readmatrix(d40(1).name);
  eval(['TP' num2str(i) '_40=x40']);

  d50=dir("Results_TP"+i+"_REG_50.csv");  
  x50=readmatrix(d50(1).name);
  eval(['TP' num2str(i) '_50=x50']);

  d60=dir("Results_TP"+i+"_REG_60.csv");  
  x60=readmatrix(d60(1).name);
  eval(['TP' num2str(i) '_60=x60']);

  d70=dir("Results_TP"+i+"_REG_70.csv");  
  x70=readmatrix(d70(1).name);
  eval(['TP' num2str(i) '_70=x70']);
end

MP_m40 = [TP1_m40 TP2_m40 TP3_m40 TP4_m40 TP5_m40 TP6_m40 TP7_m40 TP8_m40 ...
            TP9_m40 TP10_m40 TP11_m40 TP12_m40 TP13_m40 TP14_m40 TP15_m40 TP16_m40];

MP_m30 = [TP1_m30 TP2_m30 TP3_m30 TP4_m30 TP5_m30 TP6_m30 TP7_m30 TP8_m30 ...
             TP9_m30 TP10_m30 TP11_m30 TP12_m30 TP13_m30 TP14_m30 TP15_m30 TP16_m30];

MP_m20 = [TP1_m20 TP2_m20 TP3_m20 TP4_m20 TP5_m20 TP6_m20 TP7_m20 TP8_m20 ...
             TP9_m20 TP10_m20 TP11_m20 TP12_m20 TP13_m20 TP14_m20 TP15_m20 TP16_m20];

MP_m10 = [TP1_m10 TP2_m10 TP3_m10 TP4_m10 TP5_m10 TP6_m10 TP7_m10 TP8_m10...
            TP9_m10 TP10_m10 TP11_m10 TP12_m10 TP13_m10 TP14_m10 TP15_m10 TP16_m10];

MP_0 = [TP1_0 TP2_0 TP3_0 TP4_0 TP5_0 TP6_0 TP7_0 TP8_0 ...
            TP9_0 TP10_0 TP11_0 TP12_0 TP13_0 TP14_0 TP15_0 TP16_0];

MP_10 = [TP1_10 TP2_10 TP3_10 TP4_10 TP5_10 TP6_10 TP7_10 TP8_10 ...
            TP9_10 TP10_10 TP11_10 TP12_10 TP13_10 TP14_10 TP15_10 TP16_10];

MP_20 = [TP1_20 TP2_20 TP3_20 TP4_20 TP5_20 TP6_20 TP7_20 TP8_20 ...
            TP9_20 TP10_20 TP11_20 TP12_20 TP13_20 TP14_20 TP15_20 TP16_20];

MP_30 = [TP1_30 TP2_30 TP3_30 TP4_30 TP5_30 TP6_30 TP7_30 TP8_30 ...
            TP9_30 TP10_30 TP11_30 TP12_30 TP13_30 TP14_30 TP15_30 TP16_30];

MP_40 = [TP1_40 TP2_40 TP3_40 TP4_40 TP5_40 TP6_40 TP7_40 TP8_40 ...
            TP9_40 TP10_40 TP11_40 TP12_40 TP13_40 TP14_40 TP15_40 TP16_40];

MP_50 = [TP1_50 TP2_50 TP3_50 TP4_50 TP5_50 TP6_50 TP7_50 TP8_50 ...
            TP9_50 TP10_50 TP11_50 TP12_50 TP13_50 TP14_50 TP15_50 TP16_50];

MP_60 = [TP1_60 TP2_60 TP3_60 TP4_60 TP5_60 TP6_60 TP7_60 TP8_60 ...
            TP9_60 TP10_60 TP11_60 TP12_60 TP13_60 TP14_60 TP15_60 TP16_60];

MP_70 = [TP1_70 TP2_70 TP3_70 TP4_70 TP5_70 TP6_70 TP7_70 TP8_70 ...
            TP9_70 TP10_70 TP11_70 TP12_70 TP13_70 TP14_70 TP15_70 TP16_70];
%% plot many TPs Vout / slope
% showing different colors for mean value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
close all;

vin = 1.2; % change plot for v_in (1.08; 1.2; 1.32)

table = MP_10;
color = jet(17);

figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor

%for i=9:9:72
for i=81:9:144
    %j = TP * 9;
    j = i/9;
    if j <= 8
        subplot(2,4,j);grid on, grid minor
        hold on
    else 
        subplot(2,4,j-8);grid on, grid minor
        hold on
    end
    for p = 1:769
        if table(p,6) == vin
        c = table(p,8)+1;
        plot(table(p,7),table(p,i),"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','none','Color',color(c,:))
        volt = table(p,6);
        ylabel('bandgap [V]')
        xlabel('slope')
        title("TP"+j+" VDDA = "+volt+"V at "+table(p,4)+"°C")
        labels=num2str((0:15).','mean: %d');
        %legend(labels)
        %legend('Location','southwest')
        end
    end
end
%% plot one TP Vout / slope 
% showing different colors for mean value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
close all;

vin = 1.2; % change plot for v_in (1.08; 1.2; 1.32)
TP = 16;

table = MP_10;
color = jet(17);

figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
for p = 1:769
    if table(p,6) == vin
    c = table(p,8)+1;
    plot(table(p,7),table(p,TP*9),"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','none','Color',color(c,:))
    volt = table(p,6);
    ylabel('bandgap [V]')
    xlabel('slope')
    title("TP"+TP+" VDDA = "+volt+"V at "+table(p,4)+"°C")
    labels=num2str((0:15).','mean: %d');
    legend(labels)
    legend('Location','southwest')
    end
end

%% plot single TP Vout / mean
% showing different colors for mean value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all

TP = 1;
v_in = 1.2;
table = MP_m10;

color = jet(17);
figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on

for p = 1:769
    if table(p,6) == v_in
    c = table(p,7)+1;
    plot(table(p,8), table(p,TP*9),"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','none','Color',color(c,:));grid on, grid minor
    volt = table(p,6);
    ylabel('bandgap [V]')
    xlabel('mean')
    title("TP"+TP+" VDDA = "+volt+"V at "+table(p,4)+"°C");
    legend('slope: 0','','','','','','','','','','','','','','','', ...
        'slope: 1','','','','','','','','','','','','','','','','', ...
        'slope: 2','','','','','','','','','','','','','','','','', ...
        'slope: 3','','','','','','','','','','','','','','','','', ...
        'slope: 4','','','','','','','','','','','','','','','','', ...
        'slope: 5','','','','','','','','','','','','','','','','', ...
        'slope: 6','','','','','','','','','','','','','','','','', ...
        'slope: 7','','','','','','','','','','','','','','','','', ...
        'slope: 8','','','','','','','','','','','','','','','','', ...
        'slope: 9','','','','','','','','','','','','','','','','', ...
        'slope: 10','','','','','','','','','','','','','','','','', ...
        'slope: 11','','','','','','','','','','','','','','','','', ...
        'slope: 12','','','','','','','','','','','','','','','','', ...
        'slope: 13','','','','','','','','','','','','','','','','', ...
        'slope: 14','','','','','','','','','','','','','','','','', ...
        'slope: 15','','','','','','','','','','','','','','','','')      
    legend('Location','southeast')
    end
end


%% plot all 16 TPs Vout / mean
% showing different colors for mean value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all

color = jet(17);
figure('Name','bandgap characterization','NumberTitle','off');

v_in = 1.2;
table = MP_10;

%for i=9:9:72
for i=81:9:144
    j = i/9;
    if j <= 8
        subplot(2,4,j);grid on, grid minor
    hold on
    else 
        subplot(2,4,j-8);grid on, grid minor
        hold on
    end
    for p = 1:769
        if table(p,6) == v_in
        c = table(p,7)+1;
        plot(table(p,8), table(p,i),"LineWidth",1.5,'Marker','.','MarkerSize',12,'LineStyle','none','Color',color(c,:));grid on, grid minor
        volt = table(p,6);
        ylabel('bandgap [V]')
        xlabel('mean')
        %ylim([0.42 0.67])
        title("TP"+j+" VDDA = "+volt+"V at "+table(p,4)+"°C");
        %legend('slope: 0','','','','','','','','','','','','','','','', ...
%             'slope: 1','','','','','','','','','','','','','','','','', ...
%             'slope: 2','','','','','','','','','','','','','','','','', ...
%             'slope: 3','','','','','','','','','','','','','','','','', ...
%             'slope: 4','','','','','','','','','','','','','','','','', ...
%             'slope: 5','','','','','','','','','','','','','','','','', ...
%             'slope: 6','','','','','','','','','','','','','','','','', ...
%             'slope: 7','','','','','','','','','','','','','','','','', ...
%             'slope: 8','','','','','','','','','','','','','','','','', ...
%             'slope: 9','','','','','','','','','','','','','','','','', ...
%             'slope: 10','','','','','','','','','','','','','','','','', ...
%             'slope: 11','','','','','','','','','','','','','','','','', ...
%             'slope: 12','','','','','','','','','','','','','','','','', ...
%             'slope: 13','','','','','','','','','','','','','','','','', ...
%             'slope: 14','','','','','','','','','','','','','','','','', ...
%             'slope: 15','','','','','','','','','','','','','','','','')      
        %legend('Location','southeast')
        end
    end
end

%% plot single TP Vout / temp for all slopes
% mean = 7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
close all;

MP_ALL = [MP_m40 MP_m30 MP_m20 MP_m10 MP_0 MP_10 MP_20 MP_30 MP_40 MP_50 MP_60 MP_70]; 

vin = 1.2; % change plot for v_in (1.08; 1.2; 1.32)
TP = 1;
color = jet(17);

figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
long = size(MP_ALL);

for i=9*TP:144:long(1,2)
    if TP > 0 && TP <= 16
        MAX = 0;
    for p=1:769
        c = MP_ALL(p,i-2)+1;
        if MP_ALL(p,6) == vin && MP_ALL(p,i-1) == 7 
            plot(MP_ALL(p,i-5),MP_ALL(p,i),"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(c,:));
            volt = MP_ALL(p,6);
            ylabel('bandgap [V]')
            xlabel('temperature [°C]')
            xlim([-40 70])
            title("TP"+TP+" VDDA = "+volt+"V; mean= "+MP_ALL(p,8)+"")
            labels=num2str((0:15).','slope: %d');
            legend(labels);
            legend('Location','southwest')
        end
    end
    else 
        fprintf('TP out of range\n')
    end
end

%% plot all TP Vout / temp for slope=7 mean=7
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
%close all;

MP_ALL = [MP_m40 MP_m30 MP_m20 MP_m10 MP_0 MP_10 MP_20 MP_30 MP_40 MP_50 MP_60 MP_70]; 

vin = 1.2; % change plot for v_in (1.08; 1.2; 1.32)
TP = 1;
color = jet(17);

figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
long = size(MP_ALL);
for TP=1:16
    for i=9*TP:144:long(1,2)
        if TP > 0 && TP <= 16
            MAX = 0;
        for p=1:769
            c = TP;
            if MP_ALL(p,6) == vin && MP_ALL(p,i-1) == 7 && MP_ALL(p,i-2) == 7
                plot(MP_ALL(p,i-5),MP_ALL(p,i),"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(c,:));
                volt = MP_ALL(p,6);
                ylabel('bandgap [V]')
                xlabel('temperature [°C]')
                xlim([-40 70])
                title("All TPs VDDA = "+volt+"V; mean= "+MP_ALL(p,8)+"; slope= "+MP_ALL(p,7)+"")
                labels=num2str((0:15).','slope: %d');
                legend(labels);
                legend('Location','southwest')
            end
        end
        else 
            fprintf('TP out of range\n')
        end
    end
end
%% plot only one slope
clc
close all

figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
z = 1;
for TP= 1:16
    for i=9*TP:144:long(1,2)
        if TP > 0 && TP <= 16
            for p=1:long(1,1)
                if MP_ALL(p,6) == 1.2 && MP_ALL(p,i-1) == 7 && MP_ALL(p,i-2) == 7
                    TP_slope7(z,1:3) = MP_ALL(p,[i-5 i i-2])
                    z = z + 1;
                end
            end
        end
    end
    start = TP+(TP-1)*11;
    ende = start + 11;
    plot(TP_slope7(start:ende,1),TP_slope7(start:ende,2),"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(TP,:));
    ylabel('bandgap [V]')
    xlabel('temperature [°C]')
    xlim([-40 70])
    title("All TPs for VDDA = 1.2V; mean= 7; slope= 7");
    labels=num2str((1:16).','TP%d');
    legend(labels);
    legend('Location','southwest')
    writematrix(TP_slope7,'C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Matlab\Data\TP1_TEMP_SLOPE7.csv');
end


%% plot single TP Vout / temp for all mean
% slope = 7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
close all;

MP_ALL = [MP_m40 MP_m30 MP_m20 MP_m10 MP_0 MP_10 MP_20 MP_30 MP_40 MP_50 MP_60 MP_70]; 

vin = 1.2; % change plot for v_in (1.08; 1.2; 1.32)
TP = 8;
slope_=10;
color = jet(17);

figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
long = size(MP_ALL);

for i=9*TP:144:long(1,2)
    if TP > 0 && TP <= 16
        for p=1:769
            c = MP_ALL(p,i-1)+1;
            if MP_ALL(p,6) == vin && MP_ALL(p,i-2) == slope_ 
                plot(MP_ALL(p,i-5),MP_ALL(p,i),"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(c,:));
                volt = MP_ALL(p,6);
                ylabel('bandgap [V]')
                xlabel('temperature [°C]')
                xlim([-40 70])
                title("TP"+TP+" VDDA = "+volt+"V; slope= "+MP_ALL(p,i-2)+"")
                labels=num2str((0:15).','mean: %d');
                legend(labels);
                legend('Location','southwest')
            end
        end
    end
end
%% print data to csv
clc;
close all;

MP_ALL = [MP_m40 MP_m30 MP_m20 MP_m10 MP_0 MP_10 MP_20 MP_30 MP_40 MP_50 MP_60 MP_70]; 

 TP=1;
    z = 1;
    clear("A");
    for i= 9*TP:144:long(1,2)
        for p = 1:769
            if MP_ALL(p,i-3) == 1.2 && MP_ALL(p,i-1) == 7
                A(z,1:4) = MP_ALL(p,[i i-5 i-2 i-1]);
                z = z+1;
            end
        end
    end
    writematrix(A,'C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Matlab\Data\TP1_TEMP.csv');



%% calculate and plot TC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
%close all

MP_ALL = [MP_m40 MP_m30 MP_m20 MP_m10 MP_0 MP_10 MP_20 MP_30 MP_40 MP_50 MP_60 MP_70]; 
long = size(MP_ALL);

range = 258:513;

A = zeros(192,4);

% extract all data for VDDA 1,2V and mean = 7
for TP=1:16
    z = 1;
    clear("A");
    for i= 9*TP:144:long(1,2)
        for p = 1:769
            if MP_ALL(p,i-3) == 1.2 && MP_ALL(p,i-1) == 7
                A(z,1:4) = MP_ALL(p,[i i-5 i-2 i-1]);
                eval(['TP' num2str(TP) '_MEAN_7=A']);
                z = z+1;
            end
        end
    end
end

% find max/min for each slope
long = size(TP1_MEAN_7);

for TP = 1:16
Table = eval(['TP' int2str(TP) '_MEAN_7']);
clear("TP_buff")
    for slope = 0:15
        z = 1;
        for p=1:long(1,1)
            if Table(p,3) == slope
                TP_buff(z,1:2) = Table(p,[1 3])
                z = z + 1;
            end
            
        end
        TP_MIN(slope+1,1:2) = min(TP_buff)
        TP_MAX(slope+1,1:2) = max(TP_buff);
        TP_ALL = [TP_MAX TP_MIN];
        clear("TP_buff")
    end
    eval(['TP' int2str(TP) '_EXTR= TP_ALL']);
end

% get vout 30°C
for TP = 1:16
Table = eval(['TP' int2str(TP) '_MEAN_7']);
    for slope = 0:15
        z = 1;
        for p=1:long(1,1)
            if Table(p,3) == slope && Table(p,2) == 30
                TP_buff(z,1:2) = Table(p,[1 3]);
                z = z + 1;
            end
        end
        TP_30(slope+1,1:2) = TP_buff;
        clear("TP_buff");
    end
    eval(['TP' int2str(TP) '_vout_30= TP_30']);
end

% calculate TC
for TP=1:16
clear("TC_buff")
table_extr = eval(['TP' num2str(TP) '_EXTR']);
TP_vout_30 = eval(['TP' num2str(TP) '_vout_30']);
    for slope = 1:16
        V_MAX = table_extr(slope,1);
        V_MIN = table_extr(slope,3);
        Vout_30 = TP_vout_30(slope,1);
        delta = V_MAX-V_MIN;

        TC = ((delta/Vout_30)/110)*10^6;
        
        TC_buff(slope,1) = slope-1; 
        TC_buff(slope,2) = TC;
    end
    eval(['TP' num2str(TP) '_TC=TC_buff'])
end


% plot TCs
color = jet(17);

figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
for TP=1:16
    table_tc = eval(['TP' num2str(TP) '_TC']);
    TC = table_tc(:,2);
    slope = table_tc(:,1);
    c = TP;
    plot(slope,TC,"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(c,:));grid on, grid minor;
end

ylabel('TC [ppm/°C]')
xlabel('slope')
title("Temperature coefficients")
labels=num2str((1:16).','TP: %d');
legend(labels);
legend('Location','southwest')

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%      find best TC        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clc
%close all

MP_ALL = [MP_m40 MP_m30 MP_m20 MP_m10 MP_0 MP_10 MP_20 MP_30 MP_40 MP_50 MP_60 MP_70]; 
long = size(MP_ALL);

for TP=1:16
    z = 1;
    clear("B");
    for i= 9*TP:144:long(1,2)
        for p = 1:769
            if MP_ALL(p,i-3) == 1.2
                B(z,1:4) = MP_ALL(p,[i i-5 i-2 i-1]);
                z = z+1;
            end
        end
    end
    eval(['TP' num2str(TP) '_MEAN_SLOPE=B']);
end

% write data to csv
for TP = 1:16
    BUFF = eval(['TP' num2str(TP) '_MEAN_SLOPE']);
    NEW = BUFF(:,[1 3 4]);
    eval(['TP' num2str(TP) '_VOUT=NEW']);
end
F = [TP1_VOUT TP2_VOUT TP3_VOUT TP4_VOUT TP5_VOUT TP6_VOUT TP7_VOUT TP8_VOUT TP9_VOUT ...
    TP10_VOUT TP11_VOUT TP12_VOUT TP13_VOUT TP14_VOUT TP15_VOUT TP16_VOUT];
writematrix(F, "C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Matlab\Data\VOUT_TPs.csv");



long = size(TP1_MEAN_SLOPE);

% find min/max

for TP = 1:16
    Table = eval(['TP' int2str(TP) '_MEAN_SLOPE']);
    %clear("TP_buff")
        x = 1;
        i = 1;
    for slope = 0:15
        z = 1;
        for p=1:long(1,1)
            if Table(p,3) == slope
                TP_buffer(z,1:4) = Table(p,[1 2 3 4]);
                z = z + 1;
            end
        end
    
        %clear("EXTR_ALL")
        for mean = 0:15
            for t = 1:192        
                if TP_buffer(t,4) == mean
                TP_EXT(x,1:4) = TP_buffer(t,[1 2 3 4]);
                x = x+1;
                end
            end
            x = 1;
            MIN_ = min(TP_EXT);
            MAX_ = max(TP_EXT);
            EXTR_ALL(i, 1:8) = [MAX_ MIN_];
            %clear("TP_EXT")
            i = i + 1;
       end
    end
    eval(['TP' int2str(TP) '_EXTR_ALL= EXTR_ALL']);
end

% get vout 30°C
for TP = 1:16
Table = eval(['TP' int2str(TP) '_MEAN_SLOPE']);
z = 1;
    for slope = 0:15
        for p=1:long(1,1)
            if Table(p,3) == slope && Table(p,2) == 30
                TP_buff_30(z,1:4) = Table(p,[1 2 3 4])
                z = z + 1;
            end
        end
        TP_30 = TP_buff_30;
    end
    eval(['TP' int2str(TP) '_vout_all_30= TP_30']);
end

% calculate TC
long = size(TP1_EXTR_ALL);

for TP=1:16
table_tc_all = eval(['TP' num2str(TP) '_EXTR_ALL']);
TP_vout_all_30 = eval(['TP' num2str(TP) '_vout_all_30']);

    for column = 1:long(1,1)
        V_MAX_all = table_tc_all(column,1);
        V_MIN_all = table_tc_all(column,5);
        Vout_30_all = TP_vout_all_30(column,1);
        delta_V = V_MAX_all-V_MIN_all;

        TC_all = ((delta_V/Vout_30_all)/110)*10^6;
         
        TC_buffer(column,1) = TC_all;
        TC_buffer(column,2) = table_tc_all(column,3);
        TC_buffer(column,3) = table_tc_all(column,4);
        
    end
    eval(['TP' num2str(TP) '_TC_ALL=TC_buffer'])
end

% write TC in csv
T = [TP1_TC_ALL TP2_TC_ALL TP3_TC_ALL TP4_TC_ALL TP5_TC_ALL TP6_TC_ALL TP7_TC_ALL TP8_TC_ALL...
    TP9_TC_ALL TP10_TC_ALL TP11_TC_ALL TP12_TC_ALL TP13_TC_ALL TP14_TC_ALL TP15_TC_ALL TP16_TC_ALL];

writematrix(T, "C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Matlab\Data\TC_all_TPs.csv");

% plot TCs
% plot TC over slope and change color for mean
color = jet(17);

figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
for TP=1:16
    table_tc = eval(['TP' num2str(TP) '_TC_ALL']);
    TC_ = table_tc(:,1);
    slope_ = table_tc(:,2);
    %mean = table_tc()
    c = TP;
    plot(slope_,TC_,"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','none','Color',color(c,:));grid on, grid minor;
end

ylabel('TC [ppm/°C]')
xlabel('slope')
title("Temperature coefficients")
labels=num2str((1:16).','TP: %d');
legend(labels);
legend('Location','southwest')






%% Plot Vin / Vout for every TP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc 
close all

for i=1:16
  up40=dir("Results_TP"+i+"_TEMP_m40_0_UP.csv");   
  xup40=readmatrix(up40(1).name);
  eval(['TP' num2str(i) '_m40_vin=xup40']);

  down40=dir("Results_TP"+i+"_TEMP_m40_132_DOWN.csv");   
  xdown40=readmatrix(down40(1).name);
  eval(['TP' num2str(i) '_m40_vin_down=xdown40']);

  up30=dir("Results_TP"+i+"_TEMP_30_0_UP.csv");   
  xup30=readmatrix(up30(1).name);
  eval(['TP' num2str(i) '_30_vin=xup30']);

  down30=dir("Results_TP"+i+"_TEMP_30_132_DOWN.csv");   
  xdown30=readmatrix(down30(1).name);
  eval(['TP' num2str(i) '_30_vin_down=xdown30']);

  up70=dir("Results_TP"+i+"_TEMP_70_0_UP.csv");   
  xup70=readmatrix(up70(1).name);
  eval(['TP' num2str(i) '_70_vin=xup70']);

  down70=dir("Results_TP"+i+"_TEMP_70_132_DOWN.csv");   
  xdown70=readmatrix(down70(1).name);
  eval(['TP' num2str(i) '_70_vin_down=xdown70']);
end
VIN_m40_up = [TP1_m40_vin TP2_m40_vin TP3_m40_vin TP4_m40_vin TP5_m40_vin TP6_m40_vin TP7_m40_vin TP8_m40_vin ...
            TP9_m40_vin TP10_m40_vin TP11_m40_vin TP12_m40_vin TP13_m40_vin TP14_m40_vin TP15_m40_vin TP16_m40_vin];

VIN_m40_down = [TP1_m40_vin_down TP2_m40_vin_down TP3_m40_vin_down TP4_m40_vin_down TP5_m40_vin_down TP6_m40_vin_down TP7_m40_vin_down TP8_m40_vin_down ...
                TP9_m40_vin_down TP10_m40_vin_down TP11_m40_vin_down TP12_m40_vin_down TP13_m40_vin_down TP14_m40_vin_down TP15_m40_vin_down TP16_m40_vin_down];

VIN_30_down = [TP1_30_vin_down TP2_30_vin_down TP2_30_vin_down TP4_30_vin_down TP5_30_vin_down TP6_30_vin_down TP7_30_vin_down TP8_30_vin_down ...
                TP9_30_vin_down TP10_30_vin_down TP11_30_vin_down TP12_30_vin_down TP13_30_vin_down TP14_30_vin_down TP15_30_vin_down TP16_30_vin_down];

VIN_30_up = [TP1_30_vin TP2_30_vin TP3_30_vin TP4_30_vin TP5_30_vin TP6_30_vin TP7_30_vin TP8_30_vin TP9_30_vin TP10_30_vin ...
                TP11_30_vin TP12_30_vin TP13_30_vin TP14_30_vin TP15_30_vin TP16_30_vin];

VIN_70_down = [TP1_70_vin_down TP2_70_vin_down TP3_70_vin_down TP4_70_vin_down TP5_70_vin_down TP6_70_vin_down TP7_70_vin_down TP8_70_vin_down...
                TP9_70_vin_down TP10_70_vin_down TP11_70_vin_down TP12_70_vin_down TP13_70_vin_down TP14_70_vin_down TP15_70_vin_down TP16_70_vin_down];

VIN_70_up = [TP1_70_vin TP2_70_vin TP3_70_vin TP4_70_vin TP5_70_vin TP6_70_vin TP7_70_vin TP8_70_vin ...
                TP9_70_vin TP10_70_vin TP11_70_vin TP12_70_vin TP13_70_vin TP14_70_vin TP15_70_vin TP16_70_vin];


color = jet(17);
figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on

table = VIN_70_up;
j = 1;
for i=4:6:96
    if j <= 8
        plot(table(:,2),table(:,i),"LineWidth",1.5,'Marker','.','MarkerSize',18,'Color',color(j,:));
        j = j + 1;
    else
        plot(table(:,2),table(:,i),"LineWidth",1.5,'Marker','.','MarkerSize',18,'Color', color(j,:));
        j = j + 1;
    end
end
temp = table(2,5);
ylabel('bandgap [V]')
xlabel('Vin (VDDA) [V]')
xlim([0 1.32])
labels=num2str((1:16).','TP%d');
legend(labels)
legend('Location','northwest')
title("Bandgab measurements VDDA from 0V to 1,32V at "+temp+"°C")
hold off

color = jet(17);
figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on
table = VIN_70_down;
range = 2:134;
j = 1;
for i=4:6:96
    if j <= 8
        plot(table(:,2),table(:,i),"LineWidth",1.5,'Marker','.','MarkerSize',18,'Color',color(j,:));
        j = j + 1;
    else
        plot(table(:,2),table(:,i),"LineWidth",1.5,'Marker','.','MarkerSize',18,'Color', color(j,:));
        j = j + 1;
        temp = table(2,5);
    end
end

ylabel('bandgap [V]')
xlabel('Vin (VDDA) [V]')
xlim([0 1.32])
labels=num2str((1:16).','TP%d');
legend(labels)
legend('Location','northwest')
title("Bandgab measurements VDDA from 1,32V to 0V at "+temp+"°C")
hold off







