%天气预处理
%出现“雨”字为雨天，其他算晴天

clc;clear;
load database.mat;

WeatherNew = [];
Year = 2014;
Month = 1;
rain = '雨';
for i = 32:1:1126
    str = Weather(i,4);
    str = table2array(str);
    TF = strfind(str,rain);
    %若isempty()返回1，则TF为空，即没有雨字，即为晴天
    if isempty(TF) == 1
        %晴天为0
        WeatherNew(i-31,1) = 0;
    else
        %雨天为1
        WeatherNew(i-31,1) = 1;
    end
    
    %写日期
    day = Weather(i,1);
    day = table2array(day);
    Day(i-31,1) = day;
end