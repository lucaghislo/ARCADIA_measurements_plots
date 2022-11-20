%% PLOT TC

clear; clc;

% This script changes all interpreters from tex to latex. 
list_factory = fieldnames(get(groot,'factory'));
index_interpreter = find(contains(list_factory,'Interpreter'));
for i = 1:length(index_interpreter)
    default_name = strrep(list_factory{index_interpreter(i)},'factory','default');
    set(groot, default_name,'latex');
end

TCs = readtable('TC_all_TPs.csv');

TC_labels1 = strings(16, 1);
TC_labels2 = strings(16, 1);

k1 = 1;
for k2 = 1:3:46
    TC_labels1(k1, 1) = strcat("Var", num2str(k2));
    TC_labels2(k1, 1) = strcat("Var", num2str(k2+1)); % +1 per mean su X, +2 per slope su X
    k1 = k1 + 1;
end

TCs_means = nan(16, 16);
lgd = cell(16,1) ;

for j = 1:16
    f = figure('Visible', 'off');
    colors = distinguishable_colors(16, 'w');
    hold on
    
    for i = 0:15
        TCs_means(:, i+1) = TCs.(TC_labels1(j))(TCs.(TC_labels2(j))==i);
        plot([0:15], TCs_means(:, i+1), 'Color', [colors(i+1, 1), colors(i+1, 2), colors(i+1, 3)]);
        lgd{i+1} = strcat('Slope = ', " ", num2str(i));
    end
    
    legend_string(lgd, 'Location', 'northwest', 'NumColumns', 2)
    box on
    grid on
    title(['\textbf{TP', num2str(j), '}'])
    xlabel('Mean')
    ylabel('TC')
    xticks([0:15])
    
    set(gca,'FontSize', 15)
    f.Position = [200 160 1080  800];
    exportgraphics(gcf,['output/TC/mean_on_x/TP', num2str(j), '_TC_mean.pdf'],'ContentType','vector');

    fileID_out = fopen(['output/TC/data/mean_on_x/TP', num2str(j),'_TC_mean.dat'], 'w');
    fprintf(fileID_out ,'%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n', TCs_means);
end


%% MINIMIZZAZIONE TC PER MEAN E SLOPE

clear; clc;

TCs = readtable('TC_all_TPs.csv');

TC_labels1 = strings(16, 1);
TC_labels2 = strings(16, 1);
TC_labels3 = strings(16, 1);

k1 = 1;
for k2 = 1:3:46
    TC_labels1(k1, 1) = strcat("Var", num2str(k2));
    TC_labels2(k1, 1) = strcat("Var", num2str(k2+1));
    TC_labels3(k1, 1) = strcat("Var", num2str(k2+2));
    k1 = k1 + 1;
end

TC_min = nan(16, 3);

for i = 1:16
    [min_val, min_index] = min(TCs.(TC_labels1(i)));
    TC_min(i, 1) = min_val;
    TC_min(i, 2) = table2array(TCs(min_index, TC_labels2(i)));
    TC_min(i, 3) = table2array(TCs(min_index, TC_labels3(i)));
end

TC_min(:, 1) = round(TC_min(:, 1), 5);
writematrix(TC_min,'output/TC/data/best_TC_slope_mean.dat','Delimiter','tab')


%% GET VOUT BASED ON BEST TC

clearvars -except TC_min; clc;

% This script changes all interpreters from tex to latex. 
list_factory = fieldnames(get(groot,'factory'));
index_interpreter = find(contains(list_factory,'Interpreter'));
for i = 1:length(index_interpreter)
    default_name = strrep(list_factory{index_interpreter(i)},'factory','default');
    set(groot, default_name,'latex');
end

VOUTs = readtable('VOUT_TPs_2.csv');
temperatures = [-40, -30, -20, -10, 0, 10, 20, 30, 40, 50, 60, 70]';

TC_labels1 = strings(16, 1);
TC_labels2 = strings(16, 1);
TC_labels3 = strings(16, 1);
TC_labels4 = strings(16, 1);

k1 = 1;
for k2 = 1:4:61
    TC_labels1(k1, 1) = strcat("Var", num2str(k2));
    TC_labels2(k1, 1) = strcat("Var", num2str(k2+1));
    TC_labels3(k1, 1) = strcat("Var", num2str(k2+2));
    TC_labels4(k1, 1) = strcat("Var", num2str(k2+3));
    k1 = k1 + 1;
end

Vout_temp = nan(12, 2);

for k = 1:16
    j = 1;
    for i = 1:size(VOUTs, 1)
        % Var2, Var3, Var4
        if table2array(VOUTs(i, TC_labels2(k))) == temperatures(j) && table2array(VOUTs(i, TC_labels3(k))) == TC_min(k, 2) && table2array(VOUTs(i, TC_labels4(k))) == TC_min(k, 3)
            Vout_temp(j, 1) = temperatures(j);
            Vout_temp(j, 2) = table2array(VOUTs(i, TC_labels1(k)));
            if j<12
                j = j + 1;
            end
        end
    end
    
    scatter(Vout_temp(:, 1), Vout_temp(:, 2)*1000, '')
    vout_mean = mean(Vout_temp(:, 2)) * 1000
    vout_mean = round(vout_mean/10)*10
    ylim([vout_mean - 10 vout_mean + 10])
    yticks([vout_mean-10:2:vout_mean + 10])
    xlim([-50 80])
    xticks([-50:10:80])
    box on
    grid on
    title(['\textbf{TP', num2str(k), '}'])
    xlabel('Temperature [$^{\circ}$C]')
    ylabel('Vout [mV]')
    
    set(gca,'FontSize', 12)
    f.Position = [200 160 1080  800];
    exportgraphics(gcf,['output/Vout/Vout_TP', num2str(k), '_temp.pdf'],'ContentType','vector');
    writematrix(Vout_temp,['output/Vout/data/Vout_TP', num2str(k), '_temp.dat'],'Delimiter','tab')
end


%% PLOT BGR VOLTAGE (Mean = 7, All slopes, Vin = 1.2V)

clear; clc;

% This script changes all interpreters from tex to latex. 
list_factory = fieldnames(get(groot,'factory'));
index_interpreter = find(contains(list_factory,'Interpreter'));
for i = 1:length(index_interpreter)
    default_name = strrep(list_factory{index_interpreter(i)},'factory','default');
    set(groot, default_name,'latex');
end

file_names = ["m40", "m30", "m20", "m10", "0", "10", "20", "30", "40", "50", "60", "70"];
temperatures = [-40:10:70];
VOLTAGES = nan(16, 11);
colors = distinguishable_colors(16, 'w');

for i = 1:12
    data = readtable("input/Results_TP2_REG_" + file_names(i) + ".csv");
    voltage = data.Volt(data.MEAN == 7 & data.Vin == 1.2);
    VOLTAGES(:, i) = voltage;
end

f = figure("Visible", "on")
hold on
for i = 1:12
    scatter(temperatures(i), VOLTAGES(:, i), [], colors, "filled");
end
hold off

slopes = [0:1:15];
legend_entries = slopes + "  ";
legend_entries = legend_entries';

box on
%grid on
hleg =  legend_string(legend_entries, "Location", "eastoutside");
%title("\textbf{TP2 (VDDA = 1.2 V, Mean = 7)}")
xlabel("Temperature [$^{\circ}$C]")
ylabel("$V_{OUT}$ [V]")
xlim([-45 75])
xticks([-40:10:70])

htitle = get(hleg,'Title');
set(htitle,'String','\textbf{R0 conf.}')

set(gca,'FontSize', 16)
f.Position = [10 10 1000  650];
exportgraphics(gcf, 'output/TP2_mean7_voltage_vs_temperature_slopes.pdf', 'ContentType', 'vector');


%% PLOT BGR VOLTAGE (Slope = 7, All means, Vin = 1.2V)

clear; clc;

% This script changes all interpreters from tex to latex. 
list_factory = fieldnames(get(groot,'factory'));
index_interpreter = find(contains(list_factory,'Interpreter'));
for i = 1:length(index_interpreter)
    default_name = strrep(list_factory{index_interpreter(i)},'factory','default');
    set(groot, default_name,'latex');
end

file_names = ["m40", "m30", "m20", "m10", "0", "10", "20", "30", "40", "50", "60", "70"];
temperatures = [-40:10:70];
VOLTAGES = nan(16, 11);
colors = distinguishable_colors(16, 'w');

for i = 1:12
    data = readtable("input/Results_TP2_REG_" + file_names(i) + ".csv");
    voltage = data.Volt(data.SLOPE == 7 & data.Vin == 1.2);
    VOLTAGES(:, i) = voltage;
end

f = figure("Visible", "on")
hold on
for i = 1:12
    scatter(temperatures(i), VOLTAGES(:, i), [], colors, "filled");
end
hold off

means = [0:1:15];
legend_entries = means + "  ";
legend_entries = legend_entries';

box on
%grid on
hleg =  legend_string(legend_entries, "Location", "eastoutside");
%title("\textbf{TP2 (VDDA = 1.2 V, Slope = 7)}")
xlabel("Temperature [$^{\circ}$C]")
ylabel("$V_{OUT}$ [V]")
xlim([-45 75])
xticks([-40:10:70])
ylim([0.48 0.72])
yticks([0.48:0.02:0.72])

htitle = get(hleg,'Title');
set(htitle,'String','\textbf{R2 conf.}')

set(gca,'FontSize', 16)
f.Position = [10 30 1000  650];
exportgraphics(gcf, 'output/TP2_slope7_voltage_vs_temperature_means.pdf', 'ContentType', 'vector');


%% Simple 3-points plot with line interpolazion

clear; clc;

data = readtable("input/data.txt");

f = figure("Visible", "on");

hold on
plot([data.Var1(1), data.Var1(3)], [data.Var2(1), data.Var2(3)], "LineStyle", "--", "LineWidth", 1, "Color", "red")
scatter(data.Var1, data.Var2, "filled", "MarkerFaceColor", "blue")
hold off

box on
ylim([0.47 0.53])
xlim([1 1.35])
ylabel("$V_{OUT}$ [V]")
xlabel("$V_{DD}$ [V]")
set(gca,'FontSize', 11)

exportgraphics(gcf, 'output/VDD_vs_VOUT.pdf', 'ContentType', 'vector');


%% Plot #2 paper - Vout vs T

clear; clc;

% This script changes all interpreters from tex to latex. 
list_factory = fieldnames(get(groot,'factory'));
index_interpreter = find(contains(list_factory,'Interpreter'));
for i = 1:length(index_interpreter)
    default_name = strrep(list_factory{index_interpreter(i)},'factory','default');
    set(groot, default_name,'latex');
end

data = readtable("input\BGR_ALLCORNERS.dat");
legend_string = data.Properties.VariableNames;
legend_string = string(legend_string);
legend_string = legend_string(2:end)';
colors = distinguishable_colors(length(legend_string), 'w');
x = data.T;
data = table2array(data);
data = data(:, 2:end);

f = figure("Visible", "on");
hold on
for i = 1:length(legend_string)
    plot(x, data(:, i), "LineWidth", 1, "Color", [colors(i, 1), colors(i, 2), colors(i, 3)])
end
hold off

legend(legend_string, "Location", "northeastoutside")

box on
grid off
ylim([0.5 0.7])
xlim([-50 80])
ylabel("$V_{OUT}$ [V]")
xlabel("Temperature [$^{\circ}$C]")
set(gca,'FontSize', 14)

f.Position = [10 30 700  550];

exportgraphics(gcf, 'output/Vout_vs_T.pdf', 'ContentType', 'vector');