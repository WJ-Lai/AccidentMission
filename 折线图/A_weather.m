%增加天气至Data
clc;clear;
load database2.mat;

[m_Death, n_Death] = size(Death);
[m_Weather, n_Weather] = size(Weather);

%Data用于存放最终的数据：
%天气、年龄、事故类型、死伤人数
Data = [];
%读取Death的日期
for i_Death = 1:1:m_Death
    str = Death(i_Death,2);
    str = table2array(str);
    
    %提取时间
    pat = '\d\d\d\d-\d\d-\d\d';
    time =regexpi(str,pat,'match');
    %找到日期对应的id
    id = find(Day == time);
    Data(i_Death,2) = id;
    Data(i_Death,1) = Weather(id,1);
end


