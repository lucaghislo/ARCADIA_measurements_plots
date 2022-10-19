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
    
    legend(lgd, 'Location', 'northwest', 'NumColumns', 2)
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
