function [] = data_correlation_visualization(data)

f1 = figure
plotmatrix(data);
covmat = corrcoef(data);
f2 = figure
imagesc(covmat);
grid;
colorbar;
f3 = figure
boxplot(data);

end
