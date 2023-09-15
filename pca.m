function [stf, ind] = pca(data)

z_threshold = 85;
[n, m] = size(data);
gj = zscore(data); %数据标准化
r = corrcoef(gj); %计算相关系数矩阵
[x, y, z] = pcacov(r); %主成分分析 x:特征向量，y：特征值，z：各主成分的贡献率
f = sign(sum(x));
x = x.*f;
for i = 1:m
    if sum(z(1:i)) >= z_threshold
        num = i;
        break;
    end
end
df = gj*x(:,[1:num]); %计算主成分得分
tf = df*z(1:num); %计算综合得分
[stf,ind] = sort(tf,'descend');
stf = stf'; ind = ind';

end