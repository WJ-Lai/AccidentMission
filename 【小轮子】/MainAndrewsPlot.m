%���Ƶ�������������
clc;clear;
load('spss.mat')

%ת��label
[sun_label] = LabelChange(sun_spss(:,1));
[rain_label] = LabelChange(rain_spss(:,1));

%% ��������

%��������
AndrewsPlot(sun_spss(:,2:6),sun_label)
%��������
AndrewsPlot(sun_spss(:,7:11),sun_label)
%������
AndrewsPlot(sun_spss(:,12:16),sun_label)

%% ��������

%��������
AndrewsPlot(rain_spss(:,2:6),rain_label)
%��������
AndrewsPlot(rain_spss(:,7:11),rain_label)
%������
AndrewsPlot(rain_spss(:,12:16),rain_label)