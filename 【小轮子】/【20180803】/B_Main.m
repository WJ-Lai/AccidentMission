%MAIN
 
% clc;clear;
% load('weather3.mat');
% 
% %删除NAN行
% data_people(isnan(data_people(:,4)),:)=[];
% 
% %%
% %分年龄段——people
% % 青年18-30
% % 中年40-50
% % 老年60-100
% % 年龄在第6列
% data = data_people;
% year_location = 6;
% young_min = 18;
% young_max = 30;
% middle_min = 40;
% middle_max = 50;
% old_min = 60;
% old_max = 100;
% [group_young, group_middle, group_old] = DifferentYearGroup(data, year_location, young_min, young_max, middle_min, middle_max, old_min, old_max);
% 
% % 得到分年龄组的week，并将晴雨天分开
% % 青年
% [sun_week_young, rain_week_young] = NewWeatherLabel(group_young);
% [sun_people_young, rain_people_young] = WeatherPeople(group_young);
% %中年
% [sun_week_middle, rain_week_middle] = NewWeatherLabel(group_middle);
% [sun_people_middle, rain_people_middle] = WeatherPeople(group_middle);
% %老年
% [sun_week_old, rain_week_old] = NewWeatherLabel(group_old);
% [sun_people_old, rain_people_old] = WeatherPeople(group_old);
% 
% save YearGroup100.mat

clc;clear;
load YearGroup100.mat;
%% 晴天

%提取有用信息
%id_death由前面得到
id_death = [1 2 4 5 14];
n = 5;
%提取青年组
data_people = sun_people_young;
data_week = sun_week_young;
[people_young_extract, week_young_extract] = DataExtract2(data_people, data_week, id_death, n);

%提取中年组
data_people = sun_people_middle;
data_week = sun_week_middle;
[people_middle_extract, week_middle_extract] = DataExtract2(data_people, data_week, id_death, n);

%提取老年组
data_people = sun_people_old;
data_week = sun_week_old;
[people_old_extract, week_old_extract] = DataExtract2(data_people, data_week, id_death, n);

%保存数据
%散点图：事故率+死亡人数
sun_death = [people_young_extract(:,1),people_young_extract(:,2),people_middle_extract(:,1),people_middle_extract(:,2),people_old_extract(:,1),people_old_extract(:,2)];  %若只需事故率和死亡个数
%折线图       
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\【20180803】\sun_week_young.xlsx',week_young_extract);
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\【20180803】\sun_week_middle.xlsx',week_middle_extract);
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\【20180803】\sun_week_old.xlsx',week_old_extract);

%调和曲线
[m_young, n_young] = size(week_young_extract);
young_label(1:m_young,1) = {'Young'};
[m_middle, n_middle] = size(week_middle_extract);
middle_label(1:m_middle,1) = {'Middle'};
[m_old, n_old] = size(week_old_extract);
old_label(1:m_old,1) = {'Old'};
label_sun = [young_label; middle_label; old_label];
data_sun = [week_young_extract; week_middle_extract; week_old_extract];
data_sun2 = mapminmax(data_sun',-0.5,0.5)';
AndrewsPlot2(data_sun2,label_sun);
AndrewsPlot2(week_young_extract,young_label);
AndrewsPlot2(week_middle_extract, middle_label);
AndrewsPlot2(week_old_extract, old_label);
%% 雨天

%提取有用信息
%id_death由前面得到
n = 5;
%提取青年组
data_people = rain_people_young;
data_week = rain_week_young;
[people_young_extract, week_young_extract] = DataExtract2(data_people, data_week, id_death, n);

%提取中年组
data_people = rain_people_middle;
data_week = rain_week_middle;
[people_middle_extract, week_middle_extract] = DataExtract2(data_people, data_week, id_death, n);

%提取中年组
data_people = rain_people_old;
data_week = rain_week_old;
[people_old_extract, week_old_extract] = DataExtract2(data_people, data_week, id_death, n);

%保存数据
%散点图：事故率+死亡人数
rain_death = [people_young_extract(:,1),people_young_extract(:,2),people_middle_extract(:,1),people_middle_extract(:,2),people_old_extract(:,1),people_old_extract(:,2)];  %若只需事故率和死亡个数
%折线图       
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\【20180803】\rain_week_young.xlsx',week_young_extract);
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\【20180803】\rain_week_middle.xlsx',week_middle_extract);
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\【20180803】\rain_week_old.xlsx',week_old_extract);
 
%散点图点除
difference = rain_death ./ sun_death;
save data.mat
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\【20180803】\weather.xlsx',difference);

%调和曲线
[m_young, n_young] = size(week_young_extract);
young_label(1:m_young,1) = {'Young'};
[m_middle, n_middle] = size(week_middle_extract);
middle_label(1:m_middle,1) = {'Middle'};
[m_old, n_old] = size(week_old_extract);
old_label(1:m_old,1) = {'Old'};
label_rain = [young_label; middle_label; old_label];
data_rain = [week_young_extract; week_middle_extract; week_old_extract];
data_rain2 = mapminmax(data_rain',-0.5,0.5)';
AndrewsPlot2(data_rain2 ,label_rain);
AndrewsPlot2(week_young_extract,young_label);
AndrewsPlot2(week_middle_extract, middle_label);
AndrewsPlot2(week_old_extract, old_label);

data = [data_sun; data_rain];
label = [label_sun;label_rain];
AndrewsPlot2(data, label);