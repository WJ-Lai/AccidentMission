%�����ں����ڶ�Ӧ��

% clc;clear;
% load('weather0.mat');
% 
% %% �۲���û��ȱ������
% [m, n] = size(database);
% 
% for i = 1:m
%     str = database(i,7);
%     str = table2array(str);
% 
%     %��ȡʱ��
%     pat = '\d\d\d\d-\d\d-\d\d';
%     time =regexpi(str,pat,'match');
%     %�ҵ����ڶ�Ӧ��id
%     timeM(i,1) = time;
% end
% 
% clearvars -except data_people database timeM weather
% save weather.mat

clear;
load weather.mat;
%% �۲���һ������
[m, n] = size(timeM);
time = timeM(1,1);
week = 3;
for i = 1:m
    if time ~= timeM(i,1)
        week = week +1;
        time = timeM(i,1);
        if week == 8
            week = 1;
        end
        %����6��30
        if time == "2014-07-01"
            week = week +1;
            time = timeM(i,1);
            if week == 8
                week = 1;
            end
        end
    end
    weekM(i,1) = week;
    
end
dif = weekM(:,1) - data_people(:,1);
%ȱ��2014-06-30

%����ȷ�����ڸ�data_people
data_people(:,1) =  weekM(:,1);
data_people(isnan(data_people(:,4)),:)=[];

clearvars -except data_people datapeople timeM weather
save weather2.mat