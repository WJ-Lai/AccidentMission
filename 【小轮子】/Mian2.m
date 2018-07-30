%mian����2����ʾ������������
clc;clear
load('data_accident.mat')
%ȷ���¹���̬����
[id_death, id_hurt] = ImportantType(data_week,15);

%�ֶ�����λ��
id_death = [1 2 4 5 14];

%������Ρ���people
%����18-30
%����40-50
%����60-100
%�����ڵ�6��
data = data_people;
year_location = 6;
young_min = 18;
young_max = 30;
middle_min = 40;
middle_max = 50;
old_min = 60;
old_max = 100;
[group_young, group_middle, group_old] = DifferentYearGroup(data, year_location, young_min, young_max, middle_min, middle_max, old_min, old_max);

%�õ����������week������������ֿ�
%����
week_young = NewData(group_young);
[sun_people_young, rain_people_young, sun_week_young, rain_week_young] = Weather(group_young, week_young);
%����
week_middle = NewData(group_middle);
[sun_people_middle, rain_people_middle, sun_week_middle, rain_week_middle] = Weather(group_middle, week_middle);
%����
week_old = NewData(group_old);
[sun_people_old, rain_people_old, sun_week_old, rain_week_old] = Weather(group_old, week_old);

%% ����

%��ȡ������Ϣ
%id_death��ǰ��õ�
n = 5;
%��ȡ������
data_people = sun_people_young;
data_week = sun_week_young;
[people_young_extract, week_young_extract] = DataExtract(data_people, data_week, id_death, n);

%��ȡ������
data_people = sun_people_middle;
data_week = sun_week_middle;
[people_middle_extract, week_middle_extract] = DataExtract(data_people, data_week, id_death, n);

%��ȡ������
data_people = sun_people_old;
data_week = sun_week_old;
[people_old_extract, week_old_extract] = DataExtract(data_people, data_week, id_death, n);

%��������
SaveData(1,people_young_extract, people_middle_extract, people_old_extract, week_young_extract, week_middle_extract, week_old_extract);


%% ����

%��ȡ������Ϣ
%id_death��ǰ��õ�
n = 5;
%��ȡ������
data_people = rain_people_young;
data_week = rain_week_young;
[people_young_extract, week_young_extract] = DataExtract(data_people, data_week, id_death, n);

%��ȡ������
data_people = rain_people_middle;
data_week = rain_week_middle;
[people_middle_extract, week_middle_extract] = DataExtract(data_people, data_week, id_death, n);

%��ȡ������
data_people = rain_people_old;
data_week = rain_week_old;
[people_old_extract, week_old_extract] = DataExtract(data_people, data_week, id_death, n);

%��������
SaveData(2,people_young_extract, people_middle_extract, people_old_extract, week_young_extract, week_middle_extract, week_old_extract);




