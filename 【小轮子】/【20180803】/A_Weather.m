%�����������ڶ�Ӧ��

clc;clear;
load weather2.mat;

temp_week = data_people(1,1);
[m, n] = size(data_people);
i_weather = 1;

for i = 1:m
    if temp_week ~= data_people(i,1)
        temp_week = data_people(i,1);
        i_weather = i_weather + 1;
    end
    data_people(i,7) = weather(i_weather,1);
end


clearvars -except data_people
%��1��������
data(:,1) = data_people(:,7);
%��2��������
data(:,2) = 0;
%��3��������
data(:,3) = data_people(:,1);
%��4�����¹���̬
data(:,4) = data_people(:,2);
%��5�����Ա�
data(:,5) = data_people(:,3);
%6������
data(:,6) = data_people(:,4);
%7����������
data(:,7) = data_people(:,5);
%8����������
data(:,8) = data_people(:,6);
%9��label
data(:,9) = 0;

clearvars -except data
data_people = data;
clearvars -except data_people
save weather3.mat