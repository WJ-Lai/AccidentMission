%将不同年龄段提取
%青年组（18~30）、中年组（40~50）、老年组（60~）

clc;clear;
%data2.mat即为原来的data1.mat
load data2.mat;
data = sun;

Young = [];
i_Young = 1;
Middle = [];
i_Middle = 1;
Old = [];
i_Old = 1;

[m, n] = size(data);
for i = 1:m
    %青年组（18~30）
    if data(i,3) >= 18 && data(i,3) <=30
        Young(i_Young,:) = data(i,:);
        i_Young = i_Young + 1;
    end
    
    %中年组（40~50）
    if data(i,3) >= 40 && data(i,3) <= 50
        Middle(i_Middle,:) = data(i,:);
        i_Middle = i_Middle + 1;
    end
    
    %老年组（60~）
    if data(i,3) >= 60 
        Old(i_Old,:) = data(i,:);
        i_Old = i_Old + 1;
    end
end

%生成不同年龄段的dataAge.mat
clearvars -except data Young Middle Old
save dataAge.mat