%�����������ֿ����ֳ�����excel
clc;clear;
load data.mat;

sun = [];
i_sun = 1;
rain = [];
i_rain = 1;

[m, n] = size(Data);

for i = 1:m
    %��Ϊ0��Ϊ����
    if Data(i,1) == 0
        sum(i_sun,:) = Data(i,:);
        i_sun = i_sun + 1;
    end
     %��Ϊ1��Ϊ����
    if Data(i,1) == 1
        rain(i_rain,:) = Data(i,:);
        i_rain = i_rain + 1;
    end
end

%����data1.mat
%�㶨�����������