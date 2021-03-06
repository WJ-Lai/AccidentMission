%mian函数，显示函数调用流程
clc;clear
load('data_accident.mat')
%确定事故形态个数
[id_death, id_hurt] = ImportantType(data_week,15);

%手动调整位置
id_death = [1 2 4 5 14];
%雨天晴天分开
[sun_people, rain_people, sun_week, rain_week] = Weather(data_people, data_week);

%% 晴天

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
%相对死亡率 = 死亡/受伤
sun1 = [sun_young(:,1),sun_young(:,2)./sun_young(:,3),sun_middle(:,1),sun_middle(:,2)./ sun_middle(:,3),sun_old(:,1),sun_old(:,2)./sun_old(:,3)];  %若只需事故率和死亡个数
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\sun1.xlsx',sun1);
%死亡率 = 死亡/（死亡+受伤）
sun2 = [sun_young(:,1),sun_young(:,2)./(sun_young(:,2)+sun_young(:,3)),sun_middle(:,1),sun_middle(:,2)./ (sun_middle(:,2)+sun_middle(:,3)),sun_old(:,1),sun_old(:,2)./(sun_old(:,2)+sun_old(:,3))];  %若只需事故率和死亡个数
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\sun2.xlsx',sun2);
%死亡个数 = 死亡
sun3 = [sun_young(:,1),sun_young(:,2),sun_middle(:,1),sun_middle(:,2),sun_old(:,1),sun_old(:,2)];  %若只需事故率和死亡个数
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\sun3.xlsx',sun3);


%折线图和调和曲线需要数据
%data_n_week内直接用于spss
sun_spss = data_n_week;
sun_spss(isnan(sun_spss)) = 0;
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\sun_week.xlsx',sun_spss);


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

%提取中年组
data_people = group_middle;
data_week = rain_week;
[rain_middle, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%提取老年组
data_people = group_old;
data_week = rain_week;
[rain_old, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%散点图需要的数据：
%sun_X里面事故率、死亡个数、受伤个数
%rain = [rain_young(:,1:2) rain_middle(:,1:2) rain_old(:,1:2)];  %若只需事故率和死亡个数
%相对死亡率 = 死亡/受伤
rain1 = [rain_young(:,1),rain_young(:,2)./rain_young(:,3),rain_middle(:,1),rain_middle(:,2)./ rain_middle(:,3),rain_old(:,1),rain_old(:,2)./rain_old(:,3)];
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\rain1.xlsx',rain1);
%死亡率 = 死亡/（死亡+受伤）
rain2 = [rain_young(:,1),rain_young(:,2)./(rain_young(:,2)+rain_young(:,3)),rain_middle(:,1),rain_middle(:,2)./ (rain_middle(:,2)+rain_middle(:,3)),rain_old(:,1),rain_old(:,2)./(rain_old(:,2)+rain_old(:,3))];
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\rain2.xlsx',rain2);
%死亡个数 = 死亡
rain3 = [rain_young(:,1),rain_young(:,2),rain_middle(:,1),rain_middle(:,2),rain_old(:,1),rain_old(:,2)];
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\rain3.xlsx',rain3);

%折线图和调和曲线需要数据
%data_n_week内直接用于spss
rain_spss = data_n_week;
rain_spss(isnan(rain_spss)) = 0;
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\rain_week.xlsx',rain_spss);


%% 雨天晴天
% 雨天事故率/晴天事故率、雨天死亡人数/晴天死亡人数
weather = [rain_young(:,1)./sun_young(:,1),rain_young(:,2)./sun_young(:,2),rain_middle(:,1)./sun_middle(:,1),rain_middle(:,2)./sun_middle(:,2),rain_old(:,1)./sun_old(:,1),rain_old(:,2)./sun_old(:,2)];  %若只需事故率和死亡个数
xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【小轮子】\data\weather.xlsx',weather);

%% 调和曲线

AndrewsPlot(rain_spss(:,2:6),rain_spss(:,1))