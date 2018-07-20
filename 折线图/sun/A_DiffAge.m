%����ͬ�������ȡ
%�����飨18~30���������飨40~50���������飨60~��

clc;clear;
%data2.mat��Ϊԭ����data1.mat
load data2.mat;
data = sun;

Young = [];
i_Young = 1;
Middle = [];
i_Middle = 1;
Old = [];
i_Old = 1;

[m, n] = size(data);
for i = 1:m
    %�����飨18~30��
    if data(i,3) >= 18 && data(i,3) <=30
        Young(i_Young,:) = data(i,:);
        i_Young = i_Young + 1;
    end
    
    %�����飨40~50��
    if data(i,3) >= 40 && data(i,3) <= 50
        Middle(i_Middle,:) = data(i,:);
        i_Middle = i_Middle + 1;
    end
    
    %�����飨60~��
    if data(i,3) >= 60 
        Old(i_Old,:) = data(i,:);
        i_Old = i_Old + 1;
    end
end

%���ɲ�ͬ����ε�dataAge.mat
clearvars -except data Young Middle Old
save dataAge.mat