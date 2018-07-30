%mian函数2，显示函数调用流程
clc;clear
load('data_accident.mat')
%确定事故形态个数
[id_death, id_hurt] = ImportantType(data_week,15);

%手动调整位置
id_death = [1 2 4 5 14];

%分年龄段——people
%青年18-30
%中年40-50
%老年60-100
%年龄在第6列
data = data_people;
year_location = 6;
young_min = 18;
young_max = 30;
middle_min = 40;
middle_max = 50;
old_min = 60;
old_max = 100;
[group_young, group_middle, group_old] = DifferentYearGroup(data, year_location, young_min, young_max, middle_min, middle_max, old_min, old_max);

%得到分年龄组的week，并将晴雨天分开
%青年
week_young = NewData(group_young);
[sun_people_young, rain_people_young, sun_week_young, rain_week_young] = Weather(group_young, week_young);
%中年
week_middle = NewData(group_middle);
[sun_people_middle, rain_people_middle, sun_week_middle, rain_week_middle] = Weather(group_middle, week_middle);
%老年
week_old = NewData(group_old);
[sun_people_old, rain_people_old, sun_week_old, rain_week_old] = Weather(group_old, week_old);

%% 晴天

%提取有用信息
%id_death由前面得到
n = 5;
%提取青年组
data_people = sun_people_young;
data_week = sun_week_young;
[people_young_extract, week_young_extract] = DataExtract(data_people, data_week, id_death, n);

%提取中年组
data_people = sun_people_middle;
data_week = sun_week_middle;
[people_middle_extract, week_middle_extract] = DataExtract(data_people, data_week, id_death, n);

%提取中年组
data_people = sun_people_old;
data_week = sun_week_old;
[people_old_extract, week_old_extract] = DataExtract(data_people, data_week, id_death, n);

%保存数据
SaveData(1,people_young_extract, people_middle_extract, people_old_extract, week_young_extract, week_middle_extract, week_old_extract);


%% 雨天

%提取有用信息
%id_death由前面得到
n = 5;
%提取青年组
data_people = rain_people_young;
data_week = rain_week_young;
[people_young_extract, week_young_extract] = DataExtract(data_people, data_week, id_death, n);

%提取中年组
data_people = rain_people_middle;
data_week = rain_week_middle;
[people_middle_extract, week_middle_extract] = DataExtract(data_people, data_week, id_death, n);

%提取中年组
data_people = rain_people_old;
data_week = rain_week_old;
[people_old_extract, week_old_extract] = DataExtract(data_people, data_week, id_death, n);

%保存数据
SaveData(2,people_young_extract, people_middle_extract, people_old_extract, week_young_extract, week_middle_extract, week_old_extract);




