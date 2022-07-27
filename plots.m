clear; clc;

% This script changes all interpreters from tex to latex. 
list_factory = fieldnames(get(groot,'factory'));
index_interpreter = find(contains(list_factory,'Interpreter'));
for i = 1:length(index_interpreter)
    default_name = strrep(list_factory{index_interpreter(i)},'factory','default');
    set(groot, default_name,'latex');
end

TCs = readtable('TC_all_TPs.csv');
TC_labels = nan(16, 1);

for i = 1:16
    TC_labels(i) = "Var" + num2str(i);
end

TCs_means = nan(16, 16);
lgd = cell(16,1) ;

for j = 1:16
    f = figure('Visible', 'on');
    colors = distinguishable_colors(16, 'w');
    hold on
    
    for i = 0:15
        TCs_means(:, i+1) = TCs.(TC_labels(num2str(j)))(TCs.Var3==i);
        plot([0:15], TCs_means(:, i+1), 'Color', [colors(i+1, 1), colors(i+1, 2), colors(i+1, 3)]);
        lgd{i+1} = strcat('Mean = ', " ", num2str(i));
    end
    
    legend(lgd, 'NumColumns', 2)
    box on
    grid on
    title('\textbf{TP' + num2str(j) + '}')
    xlabel('Slope')
    ylabel('TC')
    xticks([0:15])
    
    exportgraphics(gcf,'output/slope_on_x/TP' + num2str(j) + '_TC_slope.pdf','ContentType','vector');
end
