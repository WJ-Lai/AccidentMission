%将晴天和雨天分开，分成两个excel
clc;clear;
load data.mat;

sun = [];
i_sun = 1;
rain = [];
i_rain = 1;

[m, n] = size(Data);

for i = 1:m
    %若为0，为晴天
    if Data(i,1) == 0
        sum(i_sun,:) = Data(i,:);
        i_sun = i_sun + 1;
    end
     %若为1，为雨天
    if Data(i,1) == 1
        rain(i_rain,:) = Data(i,:);
        i_rain = i_rain + 1;
    end
end

%生成data1.mat
%搞定晴天雨天分类