%mian函数，显示函数调用流程
clc;clear
load('data_accident.mat')
%确定事故形态个数
[id_death, id_hurt] = ImportantType(data_week,15);

%雨天晴天分开
[sun_people, rain_people, sun_week, rain_week] = Weather(data_people, data_week);

%% 晴天

%分年龄段——people
%青年18-30
%中年40-50
%老年60-100
%年龄在第6列
data = sun_people;
year_location = 6;
young_min = 18;
young_max = 30;
middle_min = 40;
middle_max = 50;
old_min = 60;
old_max = 100;
[group_young, group_middle, group_old] = DifferentYearGroup(data, year_location, young_min, young_max, middle_min, middle_max, old_min, old_max);

%提取有用信息
%id_death由前面得到
n = 5;
%提取青年组
data_people = group_young;
data_week = sun_week;
[sun_young, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%统计中年组
data_people = group_middle;
data_week = sun_week;
[sun_middle, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%统计老年组
data_people = group_old;
data_week = sun_week;
[sun_old, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%散点图需要的数据：
%sun_X里面事故率、死亡个数、受伤个数
sun = [sun_young(:,1:2) sun_middle(:,1:2) sun_old(:,1:2)];  %若只需事故率和死亡个数
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\sun.xlsx',sun);

%折线图和调和曲线需要数据
%data_n_week内直接用于spss
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\sun_week.xlsx',data_n_week);


%% 雨天

%分年龄段——people
%青年18-30
%中年40-50
%老年60-100
%年龄在第6列
data = rain_people;
year_location = 6;
young_min = 18;
young_max = 30;
middle_min = 40;
middle_max = 50;
old_min = 60;
old_max = 100;
[group_young, group_middle, group_old] = DifferentYearGroup(data, year_location, young_min, young_max, middle_min, middle_max, old_min, old_max);

%提取有用信息
%id_death由前面得到
n = 5;
%提取青年组
data_people = group_young;
data_week = rain_week;
[rain_young, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%统计中年组
data_people = group_middle;
data_week = rain_week;
[rain_middle, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%统计老年组
data_people = group_old;
data_week = rain_week;
[rain_old, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%散点图需要的数据：
%sun_X里面事故率、死亡个数、受伤个数
rain = [rain_young(:,1:2) rain_middle(:,1:2) rain_old(:,1:2)];  %若只需事故率和死亡个数
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\rain.xlsx',rain);

%折线图和调和曲线需要数据
%data_n_week内直接用于spss
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\rain_week.xlsx',data_n_week);
