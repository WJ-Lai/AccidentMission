%mian��������ʾ������������

load('data_accident.mat')
%ȷ���¹���̬����
[id_death, id_hurt] = ImportantType(data_week,15);

%��������ֿ�
[sun_people, rain_people, sun_week, rain_week] = Weather(data_people, data_week);

%% ����

%������Ρ���people
%����18-30
%����40-50
%����60-100
%�����ڵ�6��
data = sun_people;
year_location = 6;
young_min = 18;
young_max = 30;
middle_min = 40;
middle_max = 50;
old_min = 60;
old_max = 100;
[group_young, group_middle, group_old] = DifferentYearGroup(data, year_location, young_min, young_max, middle_min, middle_max, old_min, old_max);

%��ȡ������Ϣ
%id_death��ǰ��õ�
n = 5;
%��ȡ������
data_people = group_young;
data_week = sun_week;
[sun_young, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%ͳ��������
data_people = group_middle;
data_week = sun_week;
[sun_middle, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%ͳ��������
data_people = group_old;
data_week = sun_week;
[sun_old, data_n_week] = DataExtract(data_people, data_week, id_death, n);

%ɢ��ͼ��Ҫ�����ݣ�
%sun_X�����¹��ʡ��������������˸���

%����ͼ��


%% ����