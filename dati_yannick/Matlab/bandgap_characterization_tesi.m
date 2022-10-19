%% Author: Yannick Konstandin
% University of Bergamo /FH Technikum Wien
% Professor Traversi / Christopf Mittermayer
% arcadia testboard
% bandgap characterization (-40°C to 70°C)
% 


clear;
clc;
close all;

% read csv files
for i=1:16
  dm40=dir("Results_TP"+i+"_REG_m40.csv");   
  xm40=readmatrix(dm40(1).name);
  eval(['TP' num2str(i) '_m40=xm40;']);

  dm30=dir("Results_TP"+i+"_REG_m30.csv");  
  xm30=readmatrix(dm30(1).name);
  eval(['TP' num2str(i) '_m30=xm30;']);

  dm20=dir("Results_TP"+i+"_REG_m20.csv");  
  xm20=readmatrix(dm20(1).name);
  eval(['TP' num2str(i) '_m20=xm20;']);

  dm10=dir("Results_TP"+i+"_REG_m10.csv");  
  xm10=readmatrix(dm10(1).name);
  eval(['TP' num2str(i) '_m10=xm10;']);

  d0=dir("Results_TP"+i+"_REG_0.csv");  
  x0=readmatrix(d0(1).name);
  eval(['TP' num2str(i) '_0=x0;']);

  d10=dir("Results_TP"+i+"_REG_10.csv");  
  x10=readmatrix(d10(1).name);
  eval(['TP' num2str(i) '_10=x10;']);

  d20=dir("Results_TP"+i+"_REG_20.csv");  
  x20=readmatrix(d20(1).name);
  eval(['TP' num2str(i) '_20=x20;']);

  d30=dir("Results_TP"+i+"_REG_30.csv");  
  x30=readmatrix(d30(1).name);
  eval(['TP' num2str(i) '_30=x30;']);
 
  d40=dir("Results_TP"+i+"_REG_40.csv");  
  x40=readmatrix(d40(1).name);
  eval(['TP' num2str(i) '_40=x40;']);

  d50=dir("Results_TP"+i+"_REG_50.csv");  
  x50=readmatrix(d50(1).name);
  eval(['TP' num2str(i) '_50=x50;']);

  d60=dir("Results_TP"+i+"_REG_60.csv");  
  x60=readmatrix(d60(1).name);
  eval(['TP' num2str(i) '_60=x60;']);

  d70=dir("Results_TP"+i+"_REG_70.csv");  
  x70=readmatrix(d70(1).name);
  eval(['TP' num2str(i) '_70=x70;']);
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

MP_ALL = [MP_m40 MP_m30 MP_m20 MP_m10 MP_0 MP_10 MP_20 MP_30 MP_40 MP_50 MP_60 MP_70];



%% chapter 1: one TP BGR over temperature slope varying get stepwidth of slope
%  
clc
close all

TeP = 13;
mean_ = 7;
vin = 1.2;

long = size(MP_ALL);
color = jet(16);
f=figure('Name','bandgap characterization','NumberTitle','off');grid on;
hold on


z=1;
for i=9*TeP:144:long(1,2)
    for p=1:769
        c = MP_ALL(p,i-1)+1;
        if MP_ALL(p,6) == vin && MP_ALL(p,i-1) == mean_
            TP_slope015_lin(z, 1:2) = MP_ALL(p,[i-5 i]);
            z=z+1;
        end
    end
end

% change column vector to matrix with temp. and bgr
col =1;
for i=1:16
    z = 1;
    for tep = i:16:192
        TP_temp_slope(z,[col col+1]) = TP_slope015_lin(tep, 1:2);
        z = z+1;
    end
    col = col + 2;
end

for i=2:2:32
    plot(TP_temp_slope(:,i-1),TP_temp_slope(:,i)*1000,"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(i/2,:));
end
volt = MP_ALL(p,6);
ylabel('bandgap [mV]')
xlabel('T [°C]')
xlim([-40 70])
%ylim([500 710])
title("TP"+TeP+" VDDA = "+vin+"V; mean= "+mean_+"")
labels=num2str((0:15).','slope: %d');
legend(labels);
legend('Location','eastoutside')

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

%exportgraphics(gcf,('Data/Vout_temp_x.pdf'),'ContentType','vector');

color = jet(16);
header = {'TP','slope'};

exportgraphics(gcf,('Data/Vout_temp_TP16_mean_7.pdf'),'ContentType','vector');


% extract all data for VDDA 1,2V and mean = 7
for TP=1:16
    z = 1;
    clear("A");
    for i= 9*TP:144:long(1,2)
        for p = 1:769
            if MP_ALL(p,i-3) == 1.2 && MP_ALL(p,i-1) == mean_
                A(z,1:4) = MP_ALL(p,[i i-5 i-2 i-1]);
                eval(['TP' num2str(TP) '_MEAN_' num2str(mean_) '=A;']);
                z = z+1;
            end
        end
    end
end


% calculate step per temperature mean = 7
% long = size(TP1_MEAN_7);
% z=1;
% for start=2:16:178
%     for i = start:start+14
%     slope_step(z,1) = TP1_MEAN_7(i,2);    
%     slope_step(z,2) = (TP1_MEAN_7(i,1)-TP1_MEAN_7(i-1,1))*1000; % in mV
%     z=z+1;
%     end
% end
% 
% f=figure('Name','bandgap characterization','NumberTitle','off');grid on;
% hold on
% plot(slope_step(:,1),slope_step(:,2),"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color','blu');
% 
% for TP = 1:16
% Table = eval(['TP' int2str(TP) '_MEAN_7;']);
% clear("TP_buff")
%     for slope = 0:15
%         z = 1;
%         for p=1:long(1,1)
%             if Table(p,3) == slope
%                 TP_buff(z,1:2) = Table(p,[1 3]);
%                 z = z + 1;
%             end
%             
%         end
%         TP_MIN(slope+1,1:2) = min(TP_buff);
%         TP_MAX(slope+1,1:2) = max(TP_buff);
%         TP_ALL = [TP_MAX TP_MIN];
%         clear("TP_buff")
%     end
%     eval(['TP' int2str(TP) '_EXTR= TP_ALL;']);
% end

%% chapter 1.2: find best TC  
clc
close all

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
% for TP = 1:16
%     BUFF = eval(['TP' num2str(TP) '_MEAN_SLOPE']);
%     NEW = BUFF(:,[1 3 4]);
%     eval(['TP' num2str(TP) '_VOUT=NEW']);
% end
% F = [TP1_VOUT TP2_VOUT TP3_VOUT TP4_VOUT TP5_VOUT TP6_VOUT TP7_VOUT TP8_VOUT TP9_VOUT ...
%     TP10_VOUT TP11_VOUT TP12_VOUT TP13_VOUT TP14_VOUT TP15_VOUT TP16_VOUT];
VOUT = [TP1_MEAN_SLOPE TP2_MEAN_SLOPE TP3_MEAN_SLOPE TP4_MEAN_SLOPE TP5_MEAN_SLOPE TP6_MEAN_SLOPE TP7_MEAN_SLOPE TP8_MEAN_SLOPE...
        TP9_MEAN_SLOPE TP10_MEAN_SLOPE TP11_MEAN_SLOPE TP12_MEAN_SLOPE TP13_MEAN_SLOPE TP14_MEAN_SLOPE TP15_MEAN_SLOPE TP16_MEAN_SLOPE];
writematrix(VOUT, "C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Matlab\Data\VOUT_TPs.csv");



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
        for mean_ = 0:15
            for t = 1:192        
                if TP_buffer(t,4) == mean_
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
                TP_buff_30(z,1:4) = Table(p,[1 2 3 4]);
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
    eval(['TP' num2str(TP) '_TC_ALL=TC_buffer']);
end

% write TC in csv
TC_ALL = [TP1_TC_ALL TP2_TC_ALL TP3_TC_ALL TP4_TC_ALL TP5_TC_ALL TP6_TC_ALL TP7_TC_ALL TP8_TC_ALL...
    TP9_TC_ALL TP10_TC_ALL TP11_TC_ALL TP12_TC_ALL TP13_TC_ALL TP14_TC_ALL TP15_TC_ALL TP16_TC_ALL];

writematrix(TC_ALL, "C:\Users\Yannick\OneDrive - KONSTANDIN GMBH\Dokumente\Technikum\4. Semester\Project Traversi\Matlab\Data\TC_all_TPs.csv");

R = [TP1_TC_ALL; TP2_TC_ALL; TP3_TC_ALL; TP4_TC_ALL; TP5_TC_ALL; TP6_TC_ALL; TP7_TC_ALL; TP8_TC_ALL;...
    TP9_TC_ALL; TP10_TC_ALL; TP11_TC_ALL; TP12_TC_ALL; TP13_TC_ALL; TP14_TC_ALL; TP15_TC_ALL; TP16_TC_ALL];

MIN_TC = min(R);

% plot TCs
% plot TC over slope and change color for mean
color = jet(16);

f=figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
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
legend('Location','eastoutside')

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/TC_all.pdf'),'ContentType','vector');
%% chapter 2: one TP BGR over temperature get stepwidth of mean , slope fixed

clc
close all

TeP = 16;
slope = 7;
vin = 1.2;

long = size(MP_ALL);
color = jet(16);
f=figure('Name','bandgap characterization','NumberTitle','off');%grid on;
hold on
% extract all data for VDDA 1,2V and slope = 7
for TP=1:16
    z = 1;
    clear("A");
    for i= 9*TP:144:long(1,2)
        for p = 1:769
            if MP_ALL(p,i-3) == 1.2 && MP_ALL(p,i-2) == slope
                A(z,1:4) = MP_ALL(p,[i i-5 i-2 i-1]);
                eval(['TP' num2str(TP) '_SLOPE_7=A;']);
                z = z+1;
            end
        end
    end
end

z=1;
for i=9*TeP:144:long(1,2)
    for p=1:769
        c = MP_ALL(p,i-1)+1;
        if MP_ALL(p,6) == vin && MP_ALL(p,i-2) == slope
            TP_mean015_lin(z, 1:2) = MP_ALL(p,[i-5 i]);
            z=z+1;
        end
    end
end

% change column vector to matrix with temp. and bgr
col =1;
for i=1:16
    z = 1;
    for tep = i:16:192
        TP_temp_mean(z,[col col+1]) = TP_mean015_lin(tep, 1:2);
        z = z+1;
    end
    col = col + 2;
end

for i=2:2:32
    plot(TP_temp_mean(:,i-1),TP_temp_mean(:,i)*1000,"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(i/2,:));
end
volt = MP_ALL(p,6);
ylabel('bandgap [mV]')
xlabel('T [°C]')
xlim([-40 70])
ylim([460 710])
%title("TP"+TeP+" VDDA = "+vin+"V; slope = "+slope+"")
labels=num2str((0:15).','mean: %d');
%legend(labels);
%legend('Location','eastoutside')

box on;
ax = gca;   
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
%ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/Vout_temp_TP16_slope_7.pdf'),'ContentType','vector');

% calculate step per temperature slope = 7
data = eval(['TP' num2str(TeP) '_SLOPE_7;']);
z=1;
for start=2:16:178
    for i = start:start+14
    mean_step(z,1) = data(i,2);    
    mean_step(z,2) = ((data(i,1))-(data(i-1,1)))*1000; % in mV
    mean_step(z,3) = data(i,4);
    mean_step(z,4) = data(i-1,4);
    z=z+1;
    end
end

%% chapter 2.1: All TPs BGR over temperature get stepwidth of mean , slope fixed
%  change slope in chapter 2
clc
close all

%TeP = 1;
%slope=15;
vin = 1.2;
color = jet(16);
   
% change column vector to matrix with temp. and bgr
for TeP = 1:16
    col =1;
    for i=1:16
        z = 1;
        for tep = i:16:192
            TP_temp_mean(z,[col col+1]) = TP_mean015_lin(tep, 1:2);
            z = z+1;
        end
        col = col + 2;
    end
    eval(['TP' num2str(TeP) '_TEMP_MEAN=TP_temp_mean;']);
end


% calculate step per temperature slope = 7
for TP=1:16
    table=eval(['TP' num2str(TP) '_SLOPE_7;']);
    z=1;
    for start=2:16:178
        for i = start:start+14
        mean_step(z,1) = table(i,2);    
        mean_step(z,2) = ((table(i,1))-(table(i-1,1)))*1000; % in mV
        mean_step(z,3) = table(i,4);
        mean_step(z,4) = table(i-1,4);
        z=z+1;
        end
    end
    eval(['TP' num2str(TP) '_MEAN_STEP=mean_step;']);
end

f=figure('Name','bandgap characterization','NumberTitle','off')
hold on
for TP=1:16
    data = eval(['TP' num2str(TP) '_MEAN_STEP;'])
    plot(data(:,3),data(:,2),'Marker','.','MarkerSize',18,'LineStyle','none','Color',color(4,:));grid on;
end

ylabel('stepwidth [mV]')
xlabel('mean step')
xlim([1 15])
title("Stepwidth of all TPs: VDDA = "+vin+"V; slope = "+slope+"")

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
%ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/STEPWIDTH_MEAN_SLOPE_15.pdf'),'ContentType','vector');


% plot distribution of step values for all TPs %%%%%%%%%%%%%%%%%%
for TP=1:16
    data= eval(['TP' num2str(TP) '_MEAN_STEP;']);
    
    DAT = sort(data(:,2));
    pd_d = fitdist(DAT,'Normal');
    
    DIST_MEAN(TP,1) = TP;
    DIST_MEAN(TP,2) = pd_d.mu;
    DIST_MEAN(TP,3) = pd_d.sigma;
end


f=figure('Name','bandgap characterization','NumberTitle','off');grid on,
data = DIST_MEAN(:,2);
bins = 12;
DAT = sort(data(:,1));
pd_d = fitdist(DAT,'Normal');
Ad = histfit(DAT,bins,'normal'); grid on;

set(Ad(1),'FaceAlpha',.5);
set(Ad(1),'FaceColor','red');
set(Ad(2),'Color','red');
ylim([0 4.5])
title("Distributions of stepwidth mean-value of TP1-TP16 VDDA: "+vin+"V, for slope = "+slope+"");
xlabel('step width [mV]');
ylabel('counts');

legend_name = sprintf("Stepwidth mean-value of all TPs: \\mu = %3.3f, \\sigma = %3.3f",pd_d.mu, pd_d.sigma);
legend(legend_name,'')
legend('Location','northeast')

ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];

exportgraphics(gcf,('Data/DIST_MEAN_STEPWIDTH_SLOPE_15.pdf'),'ContentType','vector');

%% chapter 2.2: All TPs BGR over temperature get distribution of stepwidth of mean , slope fixed
% change slope in chapter 2

% create matrix with all step width for each mean
for TP=1:16
    ci =2;
    
    clear("A");
    for i=1:15
        z = 1;
        data = eval(['TP' num2str(TP) '_MEAN_STEP;']);
        for p = 1:180
            if data(p,3) == i
                A(z,ci-1:ci) = data(p,[2 3]);                
                z = z+1;
            end
        end
        ci = ci +2;
    end
    eval(['TP' num2str(TP) '_MEAN_STEP_SORT=A;']);
end
% plot distribution of step values for all TPs %%%%%%%%%%%%%%%%%%
STEP_WIDTH_MEAN = [TP1_MEAN_STEP_SORT; TP2_MEAN_STEP_SORT; TP3_MEAN_STEP_SORT; TP3_MEAN_STEP_SORT; TP4_MEAN_STEP_SORT; TP5_MEAN_STEP_SORT...
                    ; TP6_MEAN_STEP_SORT; TP7_MEAN_STEP_SORT; TP8_MEAN_STEP_SORT; TP9_MEAN_STEP_SORT; TP10_MEAN_STEP_SORT...
                    ; TP11_MEAN_STEP_SORT; TP12_MEAN_STEP_SORT; TP13_MEAN_STEP_SORT; TP14_MEAN_STEP_SORT; TP15_MEAN_STEP_SORT; TP16_MEAN_STEP_SORT];

for i=2:2:30  
    DAT = sort(STEP_WIDTH_MEAN(:,i-1));
    pd_d = fitdist(DAT,'Normal');
    
    DIST_PER_MEAN(i/2,1) = STEP_WIDTH_MEAN(1,i);
    DIST_PER_MEAN(i/2,2) = pd_d.mu;
    DIST_PER_MEAN(i/2,3) = pd_d.sigma;
end


exportgraphics(gcf,('Data/DIST_STEPWIDTH_PER_MEAN_SLOPE_0.pdf'),'ContentType','vector');

%% chapter 3: Distribution of BGR for all mean and slope=7
% Info: This chapter uses data of chapter 2, Please run chapter 2 first!!!

for TP=1:16
    data= eval(['TP' num2str(TP) '_SLOPE_7;']);
    
    DAT = sort(data(:,1)*1000);
    pd_d = fitdist(DAT,'Normal');
    
    DIST_SLOPE_7(TP,1) = TP;
    DIST_SLOPE_7(TP,2) = pd_d.mu;
    DIST_SLOPE_7(TP,3) = pd_d.sigma;
end

% plot distribution of mean-values
f=figure('Name','bandgap characterization','NumberTitle','off');grid on,
data = DIST_SLOPE_7(:,2);
bins = 12;
DAT = sort(data(:,1));
pd_d = fitdist(DAT,'Normal');
Ad = histfit(DAT,bins,'normal'); grid on;

set(Ad(1),'FaceAlpha',.5);
set(Ad(1),'FaceColor','red');
set(Ad(2),'Color','red');
ylim([0 4])
title("Distributions of BGR mean-value of TP1-TP16 VDDA: "+vin+"V, for slope = "+slope+"");
xlabel('mean value [mV]');
ylabel('counts');

legend_name = sprintf("Mean-values of all TPs: \\mu = %3.3f, \\sigma = %3.3f",pd_d.mu, pd_d.sigma);
legend(legend_name,'')
legend('Location','northeast')

ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];

exportgraphics(gcf,('Data/DIST_MEAN_slope_7.pdf'),'ContentType','vector');





%% chapter 4: one TP BGR over temperature with linfit slope varying delta error distribution over temp and in percent
%  mean=7
clc
close all

TEP = 8;
mean_=15;
vin = 1.2;

color = jet(16);
long = size(MP_ALL);
f=figure('Name','bandgap characterization','NumberTitle','off');grid on;
hold on

z=1;
for i=9*TEP:144:long(1,2)
    for p=1:769
        c = MP_ALL(p,i-1)+1;
        if MP_ALL(p,6) == vin && MP_ALL(p,i-1) == mean_
            TP_slope015_lin(z, 1:2) = MP_ALL(p,[i-5 i]);
            z=z+1;
        end
    end
end

% change column vector to matrix with temp. and bgr
col =1;
for i=1:16
    z = 1;
    for tep = i:16:192
        TP_temp_slope(z,[col col+1]) = TP_slope015_lin(tep, 1:2);
        z = z+1;
    end
    col = col + 2;
end

for i=2:2:32
    plot(TP_temp_slope(:,i-1),TP_temp_slope(:,i)*1000,"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(i/2,:));
end
volt = MP_ALL(p,6);
ylabel('bandgap [mV]')
xlabel('temperature [°C]')
xlim([-40 70])
title("TP"+TEP+" VDDA = "+vin+"V; mean= "+mean_+"")
labels=num2str((0:15).','slope: %d');
legend(labels);
legend('Location','eastoutside')

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/Vout_temp_TP8_mean_15.pdf'),'ContentType','vector');

color = jet(16);
header = {'TP','slope'};
colum=1;
start=1;
clear('error','err_per');
f=figure('Name','bandgap characterization','NumberTitle','off');grid on,
hold on
z =1;
for TP=2:2:32
    table_lin = TP_temp_slope(:,[TP-1 TP]);
    Temp_lin = table_lin(:,1);
    Vout = table_lin(:,2);

    % linear regression
    P = polyfit(Temp_lin,Vout,1);
    yfit = polyval(P,Temp_lin);
    
    LIN_TEMP(:,TP/2) = yfit;
    eval(['TP' num2str(TEP) '_VOUT_TEMP_LIN=LIN_TEMP;']);
    for e=1:12
       err(e,1) = (yfit(e)-table_lin(e,2))*1000;
       err_per(e,colum) = abs((err(e,1)/(table_lin(e,2)*1000))*100); % in 12 columns
       %err_per(z,1) = abs((err(e,1)/(table_lin(e,2)*1000))*100); % in one column
       z = z+1;
    end
    error(:,TP) = err(:,1); %write errors in different columns
    error(:,TP-1) = table_lin(:,1);
    fehler(start:(start-1)+12,1) = err(:,1); %write errors in one column for hist
    start = start+12;
    eval(['TP' num2str(TEP) '_LIN_ERR=fehler;']);
    eval(['TP' num2str(TEP) '_LIN_ERR_C=error;']);
    eval(['TP' num2str(TEP) '_LIN_ERR_PER=err_per;'])
    colum = colum+1;
    hold on;
    %plot(error(:,TP-1), error(:,TP),'r-.',"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','none','Color',color(TP/2,:));
    plot(Temp_lin,yfit*1000,'r-.',"LineWidth",1,'Color',color(TP/2,:))
    %plot(Temp_lin,yfit*1000,'r-.',"LineWidth",1,'Marker','.','MarkerSize',4,'LineStyle','none','Color',color(TP/2,:));
    errorbar(Temp_lin,yfit*1000,err, 'Color',color(TP/2,:))
end

ylabel('bandgap [mV]')
xlabel('temperature [°C]')
xlim([-40 70])
title("Linear regression of TP"+TEP+" VDDA = "+vin+"V; mean= "+mean_+"");
%labels=num2str((0:15).','slope: %d');
%legend(labels);
legend('slope: 0','','slope: 1','','slope: 2','','slope: 3','','slope: 4','','slope: 5','','slope: 6','','slope: 7','','slope: 8',...
 '','slope: 9','','slope: 10','','slope: 11','','slope: 12','','slope: 13','','slope: 14','','slope: 15');
legend('Location','eastoutside')

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/Vout_temp_TP8_linfit.pdf'),'ContentType','vector');

% plot distribution of errors

f=figure('Name','Distribution of TPs','NumberTitle','off'); grid on
hold on

data= eval(['TP' num2str(TEP) '_LIN_ERR;']);

bins = 12;
DAT = sort(data(:,1));
pd_d = fitdist(DAT,'Normal');
Ad = histfit(DAT,bins,'normal');
set(Ad(1),'FaceAlpha',.5);
set(Ad(1),'FaceColor','red');
set(Ad(2),'Color','red');
%ylim([0 50])
title("Distributions of y-error of TP"+TEP+" VDDA: "+vin+"V, mean="+mean_+"");
xlabel('y-error [mV]');
ylabel('counts');

legend_name = sprintf("y-error of TP%2.0f: \\mu = %3.0fe-14 mV, \\sigma = %3.3f mV",TEP,pd_d.mu*1e14, pd_d.sigma);
legend(legend_name,'')
legend('Location','northeast')

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/Vout_temp_TP1_error_hist.pdf'),'ContentType','vector');

% plot errors percent over temperature
f=figure;
temp = eval(['TP' num2str(TEP) '_LIN_ERR_C;']);
color = jet(16);
for i = 1:16
    hold on
    
    plot(temp(:,1),err_per(:,i),"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(i,:));grid on
    max(err_per(:,i));
    corr(temp(:,1),err_per(:,i))
end

labels=num2str((0:15).','slope: %d');
legend(labels);
legend('Location','eastoutside')
ylabel('y-error [%]')
xlabel('temperature [°C]')
xlim([-40 70])
title("TP"+TEP+" VDDA = "+vin+"V; mean = "+mean_+"")

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize;
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/ERROR_PER_TEMP_TP14.pdf'),'ContentType','vector');

% plot delta errors over temperature
f=figure;
temp = eval(['TP' num2str(TEP) '_LIN_ERR_C;']);
error = eval(['TP' num2str(TEP) '_LIN_ERR_C;']);
color = jet(16);
for i = 1:16
    hold on  
    plot(temp(:,1),error(:,i*2),"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(i,:));grid on
    max(err_per(:,i));
    corr(temp(:,1),err_per(:,i))
end

labels=num2str((0:15).','slope: %d');
legend(labels);
legend('Location','eastoutside')
ylabel('y-error [mV]')
xlabel('temperature [°C]')
xlim([-40 70])
title("TP"+TEP+" VDDA = "+vin+"V; mean= 7")

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize;
f.Position = [400 280 900  550];
hold off



exportgraphics(gcf,('Data/ERROR_DELTA_TEMP_TP14.pdf'),'ContentType','vector');
%% chapter 5: All errors of BGR over temperature with linfit slope varying
%  mean=7
clc
close all


TEP = 8;
mean_=7;
vin = 1.2;
color = jet(16);
for TPo=1:16    
    % change column vector to matrix with temp. and bgr
    col =1;
    for i=1:16
        z = 1;
        for tep = i:16:192
            table = eval(['TP' num2str(TPo) '_MEAN_' num2str(mean_) ';']);
            TP_temp_slope(z,col) = table(tep, 2);
            TP_temp_slope(z, col+1) = table(tep, 1);
            z = z+1;
        end
        col = col + 2;
    end
    f=figure('Name','bandgap characterization','NumberTitle','off');grid on;
    hold on
    for i=2:2:32
        plot(TP_temp_slope(:,i-1),TP_temp_slope(:,i)*1000,"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(i/2,:));
    end
    volt = MP_ALL(p,6);
    ylabel('bandgap [mV]')
    xlabel('temperature [°C]')
    xlim([-40 70])
    title("TP"+TPo+" VDDA = "+vin+"V; mean= "+mean_+"")
    labels=num2str((0:15).','slope: %d');
    legend(labels);
    legend('Location','eastoutside')
    
    box on;
    ax = gca; 
    fontsize = 12;
    ax.XAxis.FontSize = fontsize; 
    ax.YAxis.FontSize = fontsize; 
    ax.Legend.FontSize = fontsize; 
    f.Position = [400 280 900  550];
    hold off
    
    %exportgraphics(gcf,('Data/Vout_temp_TP2.pdf'),'ContentType','vector');
    
    color = jet(16);
    colum=1;
    start=1;
    clear('error');
    t=figure('Name','bandgap characterization','NumberTitle','off');grid on,
    hold on
    for TP=2:2:32
        table_lin = TP_temp_slope(:,[TP-1 TP]);
        Temp_lin = table_lin(:,1);
        Vout = table_lin(:,2);
    
        % linear regression
        P = polyfit(Temp_lin,Vout,1);
        yfit = polyval(P,Temp_lin);
        
        LIN_TEMP(:,TP/2) = yfit;
        eval(['TP' num2str(TPo) '_VOUT_TEMP_LIN=LIN_TEMP;']);
        for e=1:12
           err(e,1) = (yfit(e)-table_lin(e,2))*1000;
        end
        %error(:,colum) = err(:,1); %write errors in different columns
        error(start:(start-1)+12,1) = err(:,1);
        start = start+12;
        eval(['TP' num2str(TPo) '_LIN_ERR=error;']);
        colum = colum+1;
        hold on;
        plot(Temp_lin,yfit*1000,'r-.',"LineWidth",1,'Color',color(TP/2,:))
        plot(Temp_lin,yfit*1000,'r-.',"LineWidth",1,'Marker','.','MarkerSize',8,'LineStyle','none','Color',color(TP/2,:));
        errorbar(Temp_lin,yfit*1000,err, 'Color',color(TP/2,:))
    end
    ylabel('bandgap [mV]')
    xlabel('temperature [°C]')
    xlim([-40 70])
    title("Linear regression of TP"+TPo+" VDDA = "+vin+"V; mean= "+mean_+"")
    legend('','slope: 0','','','slope: 1','','','slope: 2','','','slope: 3','','','slope: 4','','','slope: 5','','','slope: 6','','','slope: 7','','','slope: 8',...
    '','','slope: 9','','','slope: 10','','','slope: 11','','','slope: 12','','','slope: 13','','','slope: 14','','','slope: 15');

    legend('Location','eastoutside')
    
    box on;
    ax = gca; 
    fontsize = 12;
    ax.XAxis.FontSize = fontsize; 
    ax.YAxis.FontSize = fontsize; 
    ax.Legend.FontSize = fontsize; 
    t.Position = [400 280 900  550];
    hold off

    data= eval(['TP' num2str(TPo) '_LIN_ERR;']);
    
    DAT = sort(data(:,1));
    pd_d = fitdist(DAT,'Normal');
    
    Error_all(TPo,1) = TPo;
    Error_all(TPo,2) = pd_d.mu;
    Error_all(TPo,3) = pd_d.sigma;
    Error_all(TPo,4) = mean(abs(data(:,1)));
end

mean(Error_all(:,4))


%% chapter 6: Distribution of all voltages to find middle-BGR
clc
close all
% extract all data for VDDA 1,2V
for TP=1:16
    z = 1;
    clear("A");
    for i= 9*TP:144:long(1,2)
        for p = 1:769
            if MP_ALL(p,i-3) == 1.2
                A(z,1:4) = MP_ALL(p,[i i-5 i-2 i-1]);
                eval(['TP' num2str(TP) '_ALL=A;']);
                z = z+1;
            end
        end
    end
end

for TP=1:16
    data= eval(['TP' num2str(TP) '_ALL;']);
    
    DAT = sort(data(:,1)*1000);
    pd_d = fitdist(DAT,'Normal');
    
    BGR_all(TP,1) = TP;
    BGR_all(TP,2) = pd_d.mu;
    BGR_all(TP,3) = pd_d.sigma;
end

% plot distribution of mean-values
f=figure('Name','bandgap characterization','NumberTitle','off');grid on,
data = BGR_all(:,2);
bins = 12;
DAT = sort(data(:,1));
pd_d = fitdist(DAT,'Normal');
Ad = histfit(DAT,bins,'normal'); grid on;

set(Ad(1),'FaceAlpha',.5);
set(Ad(1),'FaceColor','red');
set(Ad(2),'Color','red');
ylim([0 4])
title("Distributions of BGR mean-value of TP1-TP16 VDDA: "+vin+"V, for all configs");
xlabel('mean value [mV]');
ylabel('counts');

legend_name = sprintf("Mean-values of all TPs: \\mu = %3.3f, \\sigma = %3.3f",pd_d.mu, pd_d.sigma);
legend(legend_name,'')
legend('Location','northeast')

ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];

exportgraphics(gcf,('Data/DIST_ALL.pdf'),'ContentType','vector');

%% chapter 7: Calculation of correlation between mean and slope
clc 
close all

TP = 1;

data_slope = eval(['TP' num2str(TP) '_SLOPE_7;']);
data_mean = eval(['TP' num2str(TP) '_MEAN_7;']);
color = jet(16);

% get linfit
table_slope = data_slope(:,[1 4]);
slope_lin = table_slope(:,2);
Vout = table_slope(:,1);
% linear regression
P = polyfit(slope_lin,Vout,1)
yfit_s = polyval(P,slope_lin);

% get linfit of mean
table_mean = data_mean(:,[1 3]);
mean_lin = table_mean(:,2);
Vout_m = table_mean(:,1);

% linear regression
P_m = polyfit(mean_lin,Vout_m,1);
yfit_m = polyval(P_m,mean_lin);


% get correlation
%r = corr(data_slope(:,1), data_mean(:,1));
r = corr(data_mean(:,1), data_slope(:,1));
f=figure;
hold on
for temp = 16:16:192
    plot(data_slope(temp-15:temp,4),data_slope(temp-15:temp,1)*1000,"LineWidth",1,'Marker','.','MarkerSize',10,'LineStyle','none','Color','blu');grid on
    plot(slope_lin,yfit_s*1000,'-',"LineWidth",1,'Color','blu')
    plot(data_mean(temp-15:temp,3),data_mean(temp-15:temp,1)*1000,"LineWidth",1,'Marker','.','MarkerSize',10,'LineStyle','none','Color','red');
    plot(mean_lin,yfit_m*1000,'-',"LineWidth",1,'Color','red')
end
%plot(slope_lin,yfit_s*1000,'r-.',"LineWidth",1,'Marker','.','MarkerSize',8,'LineStyle','none','Color','blu');
%plot(mean_lin,yfit_m*1000,'r-.',"LineWidth",1,'Marker','.','MarkerSize',8,'LineStyle','none','Color','red');
%errorbar(Temp_lin,yfit*1000,err, 'Color',color(TP/2,:))

ylabel('bandgap [mV]')
xlabel('slope / mean')
xlim([0 15])
title_name = sprintf("TP"+TP+" VDDA = "+vin+"V; Temp: -40°C to 70°C\n r = %2.3f",r);
title(title_name)
legend("mean: 0-15 (slope = 7)",'linfit of mean',"slope: 0-15 (mean = 7)",'linfit of slope');
legend('Location','north')

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/CORR_MEAN_SLOPE_TP1.pdf'),'ContentType','vector');

%% chapter 8: 3D Plot of BGR
clc 
close all

TP = 1;
color = jet(18);

data = eval(['TP' num2str(TP) '_ALL;']);
mean_ = data(:,4);
slope = data(:,3);
BGR = data(:,1);
f=figure;
%plot3(mean,slope,TC,"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','none','Color','blu');grid on

scatter3(mean_(:),slope(:),BGR(:)*1000,30,BGR(:)*1000,'filled');grid on
hold on;
c = colorbar;
c.Label.String = 'BGR [mV]';

limit = 600;
hold on;
x=[0 15 15 0];
y=[0 0 15 15];
z=[limit limit limit limit];
Ad = patch(x,y,z,[.7 .7 .7]);
set(Ad(1),'FaceAlpha',.1);
set(Ad(1),'FaceColor','blu');


view(-70,30) %Anzimuth, Evaluation
%view(0,0) % plane

ylabel('slope')
xlabel('mean')
zlabel('BGR [mV]')
xlim([0 15])
title("BGR voltages of TP"+TP+" for all configurations");

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
%ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/3D_TP1_BGR_ALL.pdf'),'ContentType','vector');

%% chapter 9: 3D Plot of TC 

clc 
close all

TP = 8;
color = jet(18);

step = TP*3;
mean_ = TC_ALL(:,step);
slope = TC_ALL(:,step-1);
TC = TC_ALL(:,step-2);
f=figure;
%plot3(mean,slope,TC,"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','none','Color','blu');grid on
col = 1:100:1000;
scatter3(mean_(:),slope(:),TC(:),30,TC(:),'filled');grid on

c = colorbar;
c.Label.String = 'TC [ppm/°C]';
limit = 60;
hold on;
x=[0 15 15 0];
y=[0 0 15 15];
z=[limit limit limit limit];
Ad = patch(x,y,z,[.7 .7 .7]);
set(Ad(1),'FaceAlpha',.1);
set(Ad(1),'FaceColor','red');
%view(-95,35) %Anzimuth, Evaluation
%view(0,0) % plane

ylabel('slope')
xlabel('mean')
zlabel('TC [ppm/°C]')
xlim([0 15])
title("TC of TP"+TP+" for all configurations");
%legend('TC','limit: TC = 60')


box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
%ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/3D_TP1_ALL_TCs.pdf'),'ContentType','vector');
%exportgraphics(gcf,('Data/3D_TP1_ALL_TCs_plane.pdf'),'ContentType','vector');le','none','Marker','.','MarkerSize',18); grid on

%% chapter 10: Method 2: get best configuration for TC < 50 and BGR close to 600 mV
% !! Info: run chapter 6 first
% checkout buff_ to see results (last row shows average of columns)

clc 
close all

TP = 16;
limit = 50;
% get TC lower than limit
color = jet(18);
long = size(TC_ALL);
mean_ = TP*3;
slope = mean_-1;
tc = mean_-2;
z=1;
clear('TC_s50');
for p=1:long(1,1)
    if TC_ALL(p,tc) <= limit
        TC_s50(z,1:3) = TC_ALL(p,[tc slope mean_]);
        z=z+1;
    end
end
eval(['TP' num2str(TP) '_TC_s50=TC_s50;']);

% create new variable for configurations of above
long = size(TP1_ALL);
data_TC = eval(['TP' num2str(TP) '_TC_s50;']);
lo = size(data_TC);
data_ALL = eval(['TP' num2str(TP) '_ALL;']);

clear('v_bgr','buff_');
for tc_r=1:lo(1,1)
    z=1;
    for p = 1:long(1,1)
        if data_ALL(p,3) == data_TC(tc_r,2) && data_ALL(p,4) == data_TC(tc_r,3)
            vout_buff(z,1:3) = data_ALL(p,[1 3 4]);
            z = z+1;
        end
    end
    v_bgr(:,(tc_r*3)-2:tc_r*3) = vout_buff(:,1:3);
    s = size(vout_buff);
    % get average of vout
    av = mean(v_bgr(:,(tc_r*3)-2));
    buff_(1:s,(tc_r*3)-2:tc_r*3) = v_bgr(:,(tc_r*3)-2:tc_r*3);
    buff_(s(1,1)+2,(tc_r*3)-2) = av;
    buff_(s(1,1)+2,(tc_r*3)-1:tc_r*3) = v_bgr(1,(tc_r*3)-1:tc_r*3);
end

% TC was calculated manually
% Create table with best config for each TP and TC

header = {'TP', 'BGR','slope','mean','TC'};

% This values are the min avereage of buff_ for each TP
% BGR werte sind gerundet !!
Method_2 = [1 606.117469750000 7 9 28.8;
            2 597.121993250000 7 6 48.29;
            3 598.519222083333 9 7 36.47;
            4 598.103819750000 6 6 36.83;
            5 604.246622416667 14 15 47.69;
            6 599.096783500000 10 9 29.3;
            7 597.120366416667 8 9 44.51;
            8 599.256059333333 7 5 30.81;
            9 596.517283916667 7 5 43.92;
            10 599.544423250000 6 6 46.83;
            11 602.764291333333 7 6 30.66;
            12 599.900505500000 9 9 42.58;
            13 601.897239666667 9 9 24.18;
            14 596.420808750000 14 15 35.91;
            15 600.253859750000 8 10 40.15;
            16 602.725671916667 11 12 47.75];

% plot distribution of TCs
f=figure('Name','bandgap characterization','NumberTitle','off');grid on,
data = Method_2(:,5);
bins = 8;
DAT = sort(data(:,1));
pd_d = fitdist(DAT,'Normal');
Ad = histfit(DAT,bins,'normal'); grid on;

set(Ad(1),'FaceAlpha',.5);
set(Ad(1),'FaceColor','red');
set(Ad(2),'Color','red');
ylim([0 6])
title("Distributions of TCs of TP1-TP16 for Method 2 at VDDA: "+vin+"V");
xlabel('TC [ppm/°C]');
ylabel('counts');

legend_name = sprintf("TC of all TP for Method 2: \\mu = %3.1f ppm/°C, \\sigma = %3.1f ppm/°C",pd_d.mu, pd_d.sigma);
legend(legend_name,'')
legend('Location','northeast')

ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];

exportgraphics(gcf,('Data/DIST_METHOD_2_TC.pdf'),'ContentType','vector');

%METHOD_2 = [header; num2cell(Method_2)];
%writecell(METHOD_2,'Data/METHOD_2_BEST_CONFIG.csv');


%% chapter 11: Plot best config and dist for method 2
long = size(TC_ALL);
vin = 1.2;
% check where TC is min for given config


% create new variable for best configuration for each TP
for TP=1:16
    z = 1;
    clear("M");
    for i= 9*TP:144:1728
        for p = 1:769
            if MP_ALL(p,i-2) == Method_2(TP,3) && MP_ALL(p,i-1) == Method_2(TP,4) && MP_ALL(p,i-4) == vin
                M(z,1:4) = MP_ALL(p,[i i-5 i-2 i-1]);
                eval(['TP' num2str(TP) '_BEST_CONFIG_M2=M']);
                z = z+1;
            end
        end
    end
end

% plot best config / temp

f=figure('Name','bandgap characterization','NumberTitle','off');grid on
hold on

for TP = 1:16
    Data = eval(['TP' num2str(TP) '_BEST_CONFIG_M2']);
    plot(Data(:,2),Data(:,1)*1000,"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(TP,:));
    ylabel('bandgap [mV]')
    xlabel('temperature [°C]')
    xlim([-40 70])
    ylim([580 620])
    title("Method 2 all TPs at best config.: VDDA = "+vin+"V");
    labels=num2str((1:16).','TP%d');
    legend(labels);
    legend('Location','eastoutside')
    box on
    ax = gca; 
    fontsize = 12;
    ax.XAxis.FontSize = fontsize; 
    ax.YAxis.FontSize = fontsize; 
    ax.Legend.FontSize = fontsize; 
    f.Position = [400 280 900  550];
end

exportgraphics(gcf,('Data/TP_BEST_CONFIG_METHOD_2_132.pdf'),'ContentType','vector');
%% chapter 12: plot distribution of best configuration
long = size(TC_ALL);

for TP = 1:16
    z=1;
    step = 3*TP;
    for p = 1:long(1,1)
        if TC_ALL(p,step) == Method_2(TP,4)
            TC_MEAN(z,[1:3]) = TC_ALL(p,[step-2 step-1 step]);
            z = z + 1;
        end
    end
    [min_tc row] = min(TC_MEAN(:,1));
    TC_BEST_CONFIG(TP,[1 2 3]) = (TC_MEAN(row,[1 2 3]));
end
header = {'TC', 'slope','mean'};
CELL = [header; num2cell(TC_BEST_CONFIG)];
writecell(CELL,'Data/TC_BEST_CONFIG.csv');

% create new variable
for TP=1:16
    z = 1;
    clear("J");
    for i= 9*TP:144:1728
        for p = 1:769
            if MP_ALL(p,i-2) == TC_BEST_CONFIG(TP,2) && MP_ALL(p,i-1) == TC_BEST_CONFIG(TP,3) && MP_ALL(p,i-4) == 1.2
                J(z,1:4) = MP_ALL(p,[i i-5 i-2 i-1]);
                eval(['TP' num2str(TP) '_BEST_CONFIG=J']);
                z = z+1;
            end
        end
    end
end


% plot best config / temp
clc
close all
f=figure('Name','bandgap characterization','NumberTitle','off');grid on, grid minor
hold on

for TP = 1:16
    Data = eval(['TP' num2str(TP) '_BEST_CONFIG']);
    plot(Data(:,2),Data(:,1)*1000,"LineWidth",1.5,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(TP,:));
    ylabel('bandgap [mV]')
    xlabel('temperature [°C]')
    xlim([-40 70])
    ylim([580 620])
    title("All TPs at best config.: VDDA = 1.2V; Temp = 30°C");
    labels=num2str((1:16).','TP%d');
    legend(labels);
    legend('Location','eastoutside')
    box on
    ax = gca; 
    fontsize = 12;
    ax.XAxis.FontSize = fontsize; 
    ax.YAxis.FontSize = fontsize; 
    ax.Legend.FontSize = fontsize; 
    f.Position = [400 280 900  550];
end

exportgraphics(gcf,('Data/TP_BEST_CONFIG.pdf'),'ContentType','vector');
DATA = [TP1_BEST_CONFIG_M2; TP2_BEST_CONFIG_M2; TP3_BEST_CONFIG_M2; TP4_BEST_CONFIG_M2; TP5_BEST_CONFIG_M2;...
        TP6_BEST_CONFIG_M2; TP7_BEST_CONFIG_M2; TP8_BEST_CONFIG_M2; TP9_BEST_CONFIG_M2; TP10_BEST_CONFIG_M2;...
        TP11_BEST_CONFIG_M2; TP12_BEST_CONFIG_M2; TP13_BEST_CONFIG_M2; TP14_BEST_CONFIG_M2; TP15_BEST_CONFIG_M2; TP16_BEST_CONFIG_M2];

f=figure('Name','Distribution of TPs','NumberTitle','off'); grid on
hold on

bins = 12;
DAT = sort(DATA(:,1)*1000);
pd_d = fitdist(DAT,'Normal');
Ad = histfit(DAT,bins,'normal');
set(Ad(1),'FaceAlpha',.5);
set(Ad(1),'FaceColor','red');
set(Ad(2),'Color','red');

%title("BGR distribution at for all TPs method 2: "+vin+" V");
xlabel('Vout [mV]');
ylim([0 40])

ylabel('counts');

hist1 = sprintf("Method 2 BGR for best config.: \\mu = %3.2f mV, \\sigma = %3.2f mV",pd_d.mu, pd_d.sigma);
legend(hist1,'')
legend('Location','northeast')

box on;
ax = gca; 
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/HIST_METHOD_2.pdf'),'ContentType','vector');




%% chapter 13: Get range of measurements
clc
close all

% get mean-value and sigma for each TP for all BGRs

for TP=1:16
    data = eval(['TP' num2str(TP) '_ALL;']);
    [M, I] = min(data(:,1));
    Range_ALL_TPs(TP,1) = TP;
    Range_ALL_TPs(TP, 2) = data(I,1)*1000;
    Range_ALL_TPs(TP, 3:5) = data(I,2:4);
    [M, I] = max(data(:,1));
    Range_ALL_TPs(TP, 6) = data(I,1)*1000;
    Range_ALL_TPs(TP, 7:9) = data(I,2:4);

    DAT = sort(data(:,1));
    pd_d = fitdist(DAT,'Normal');
    Range_ALL_TPs(TP, 10) = pd_d.mu*1000;
    Range_ALL_TPs(TP, 11) = pd_d.sigma*1000;
    Range_ALL_TPs(TP, 12) = median(data(:,1)*1000);
end

    DAT = sort(Range_ALL_TPs(:,2));
    pd_min = fitdist(DAT,'Normal');
    pd_min.sigma
    DAT = sort(Range_ALL_TPs(:,6));
    pd_max = fitdist(DAT,'Normal');
    pd_max.sigma
























%% chapter 14: Step width of slope (Wie gut lässt sich Steigung trimmen?)
clc
close all

%TEP = 8;
mean_=0;
vin = 1.2;

color = jet(16);
long = size(MP_ALL);

for TEP = 1:16
    z=1;
    for i=9*TEP:144:long(1,2)
        for p=1:769
            c = MP_ALL(p,i-1)+1;
            if MP_ALL(p,6) == vin && MP_ALL(p,i-1) == mean_
                TP_slope015_lin(z, 1:2) = MP_ALL(p,[i-5 i]);
                z=z+1;
            end
        end
    end
    
    % change column vector to matrix with temp. and bgr
    col =1;
    for i=1:16
        z = 1;
        for tep = i:16:192
            TP_temp_slope(z,[col col+1]) = TP_slope015_lin(tep, 1:2);
            z = z+1;
        end
        col = col + 2;
    end

    for TP=2:2:32
        table_lin = TP_temp_slope(:,[TP-1 TP]);
        Temp_lin = table_lin(:,1)*1000;
        Vout = table_lin(:,2)*1000;
    
        % linear regression
        P = polyfit(Temp_lin,Vout,1);
        yfit = polyval(P,Temp_lin);
        
        LIN_TEMP(:,TP/2) = yfit;
        LIN_SLOPE_INTERSECTION(TP/2,1:2) = P; 
        eval(['TP' num2str(TEP) '_VOUT_TEMP_LIN=LIN_TEMP;']);
        eval(['TP' num2str(TEP) '_LIN_SLOPE_INTERSEC_MEAN_' num2str(mean_) '=LIN_SLOPE_INTERSECTION;']);
        
    end
end

% calculate difference between slopes for one step
for TP = 1:16
    data = eval(['TP' num2str(TP) '_LIN_SLOPE_INTERSEC_MEAN_' num2str(mean_) ';']);
    for slope_ = 2:16
        LIN_SLOPE_DIFF(slope_-1,TP) = abs(data(slope_-1,1))-abs(data(slope_,1));
    end
end

% average for each distance for all TPs
data = LIN_SLOPE_DIFF;
for slope_ = 1:15
    DAT = transpose(data(slope_,:));
    pd_lin = fitdist(DAT, 'normal');
    LIN_SLOPE_AVERAGE(slope_,1) = pd_lin.mu;
    LIN_SLOPE_AVERAGE(slope_,2) = pd_lin.sigma;
end

f=figure;
hold on
STEP = 1:1:15;
plot(STEP,LIN_SLOPE_AVERAGE_15(:,1),"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color','blu');grid on
plot(STEP,LIN_SLOPE_AVERAGE_7(:,1),"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color','cyan');
plot(STEP,LIN_SLOPE_AVERAGE_0(:,1),"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color','green');

ylabel('step width [mV]')
xlabel('step nr.')
xlim([1 15])
ylim([-12e-5 12e-5])
%title("TP"+TeP+" VDDA = "+vin+"V; slope = "+slope+"")
%labels=num2str((0:15).','mean: %d');
legend('step width at mean: 15','step width at mean: 7','step width at mean: 0');
legend('Location','eastoutside')

box on;
ax = gca;   
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
%ax.Legend.FontSize = fontsize; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/step_width_TP.pdf'),'ContentType','vector');

%% chapter 15: Plot BGR/mean and temp
clc
close all

color = jet(12);
TP1_TEMP = [TP1_m40 TP1_m30 TP1_m20 TP1_m10 TP1_0 TP1_10 TP1_20 TP1_30 TP1_40 TP1_50 TP1_60 TP1_70];

f=figure;
hold on

for i = 9:9:108
    for p=1:769
        if TP1_TEMP(p,i-3) == 1.2 && TP1_TEMP(p,i-2) == 7
            hold on
        plot(TP1_TEMP(p,i-1),TP1_TEMP(p,i)*1000,"LineWidth",1,'Marker','.','MarkerSize',18,'LineStyle','-','Color',color(i/9,:));grid on
        end
    end
end
ylabel('bandgap [mV]')
xlabel('mean setting')
%xlim([1 15])
%ylim([-12e-5 12e-5])
title("BGR voltages of TP1 for different mean settings; VDDA = 1.2V; slope = 7")
labels=num2str((-40:10:70).','temp.: %d°C');
legend('Temp: -40°C','','','','','','','','','','','','','','','',...
       'Temp: -30°C','','','','','','','','','','','','','','','',...
       'Temp: -20°C','','','','','','','','','','','','','','','', ...
       'Temp: -10°C','','','','','','','','','','','','','','','',...
       'Temp:   0°C','','','','','','','','','','','','','','','', ...
       'Temp:  10°C','','','','','','','','','','','','','','','',...
       'Temp:  20°C','','','','','','','','','','','','','','','',...
       'Temp:  30°C','','','','','','','','','','','','','','','',...
       'Temp:  40°C','','','','','','','','','','','','','','','',...
       'Temp:  50°C','','','','','','','','','','','','','','','',...
       'Temp:  60°C','','','','','','','','','','','','','','','',...
       'Temp:  70°C');
legend('Location','southeast')

box on;
ax = gca;   
fontsize = 12;
ax.XAxis.FontSize = fontsize; 
ax.YAxis.FontSize = fontsize; 
ax.Legend.FontSize = 10; 
f.Position = [400 280 900  550];
hold off

exportgraphics(gcf,('Data/BGR_MEAN_TP1.pdf'),'ContentType','vector');


