%绘制调和曲线主函数
clc;clear;
load('spss.mat')

%转换label
[sun_label] = LabelChange(sun_spss(:,1));
[rain_label] = LabelChange(rain_spss(:,1));

%% 绘制晴天

%死亡人数
AndrewsPlot(sun_spss(:,2:6),sun_label)
%受伤人数
AndrewsPlot(sun_spss(:,7:11),sun_label)
%死亡率
AndrewsPlot(sun_spss(:,12:16),sun_label)

%% 绘制雨天

%死亡人数
AndrewsPlot(rain_spss(:,2:6),rain_label)
%受伤人数
AndrewsPlot(rain_spss(:,7:11),rain_label)
%死亡率
AndrewsPlot(rain_spss(:,12:16),rain_label)