%����Ԥ����
%���֡��ꡱ��Ϊ���죬����������

clc;clear;
load database.mat;

WeatherNew = [];
Year = 2014;
Month = 1;
rain = '��';
for i = 32:1:1126
    str = Weather(i,4);
    str = table2array(str);
    TF = strfind(str,rain);
    %��isempty()����1����TFΪ�գ���û�����֣���Ϊ����
    if isempty(TF) == 1
        %����Ϊ0
        WeatherNew(i-31,1) = 0;
    else
        %����Ϊ1
        WeatherNew(i-31,1) = 1;
    end
    
    %д����
    day = Weather(i,1);
    day = table2array(day);
    Day(i-31,1) = day;
end