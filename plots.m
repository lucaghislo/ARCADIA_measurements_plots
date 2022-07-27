clear; clc;

% This script changes all interpreters from tex to latex. 
list_factory = fieldnames(get(groot,'factory'));
index_interpreter = find(contains(list_factory,'Interpreter'));
for i = 1:length(index_interpreter)
    default_name = strrep(list_factory{index_interpreter(i)},'factory','default');
    set(groot, default_name,'latex');
end


%% PLOT TC

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
    
    legend(lgd, 'Location', 'northeast', 'NumColumns', 2)
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

k1 = 1;
for k2 = 1:3:46
    TC_labels1(k1, 1) = strcat("Var", num2str(k2));
    k1 = k1 + 1;
end

TCs_TPs = nan(256, 16);

for i = 1:16
    
end
