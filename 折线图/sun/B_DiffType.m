%将不同类型分开
clc;clear;
load dataAge.mat;

%%
%青年组
group = Young;
%行代表不同类型，列分别为类型代码、个数、死、伤个数、死亡率
TypeData = zeros(23,6);
i_type = 1;
%清理NaN数据
[m_NaN,n_NaN]=find(isnan(group)); % 找出NaN数据位置
group(m_NaN,:)=[]; %删除含有NaN的行，x(:,n)=[]可以删除列
%分类
[m, n] = size(group);
group = sortrows(group,4);
temp = group(1,4);
for i = 1:m
    %若类型相同，则个数加一，且死伤个数相加
    if group(i,4) == temp
        %个数加一
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %死伤个数相加
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    %若不行不同，则temp变化，换行，个数加一，死伤个数相加
    else
        %换行
        temp = group(i,4);
        i_type = i_type + 1;
        %个数加一
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %死伤个数相加
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    end
    TypeData(i_type,1) = temp;
end
%计算事故率
sum_accident= sum(TypeData(:,2));
TypeData(:,5) = TypeData(:,2)/sum_accident;
%计算死亡率
sum_DH = TypeData(:,3) + TypeData(:,4);
TypeData(:,6) = TypeData(:,3) ./ sum_DH;
%将NaN变为0
TypeData(isnan(TypeData)) = 0;

TypeData_Young = TypeData;

%%
%中年组
group = Middle;
%行代表不同类型，列分别为类型代码、个数、死、伤个数、死亡率
TypeData = zeros(23,6);
i_type = 1;
%清理NaN数据
[m_NaN,n_NaN]=find(isnan(group)); % 找出NaN数据位置
group(m_NaN,:)=[]; %删除含有NaN的行，x(:,n)=[]可以删除列
%分类
[m, n] = size(group);
group = sortrows(group,4);
temp = group(1,4);
for i = 1:m
    %若类型相同，则个数加一，且死伤个数相加
    if group(i,4) == temp
        %个数加一
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %死伤个数相加
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    %若不行不同，则temp变化，换行，个数加一，死伤个数相加
    else
        %换行
        temp = group(i,4);
        i_type = i_type + 1;
        %个数加一
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %死伤个数相加
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    end
    TypeData(i_type,1) = temp;
end
%计算事故率
sum_accident= sum(TypeData(:,2));
TypeData(:,5) = TypeData(:,2)/sum_accident;
%计算死亡率
sum_DH = TypeData(:,3) + TypeData(:,4);
TypeData(:,6) = TypeData(:,3) ./ sum_DH;
%将NaN变为0
TypeData(isnan(TypeData)) = 0;

TypeData_Middle = TypeData;

%%
%老年组
group = Old;
%行代表不同类型，列分别为类型代码、个数、死、伤个数、死亡率
TypeData = zeros(23,6);
i_type = 1;
%清理NaN数据
[m_NaN,n_NaN]=find(isnan(group)); % 找出NaN数据位置
group(m_NaN,:)=[]; %删除含有NaN的行，x(:,n)=[]可以删除列
%分类
[m, n] = size(group);
group = sortrows(group,4);
temp = group(1,4);
for i = 1:m
    %若类型相同，则个数加一，且死伤个数相加
    if group(i,4) == temp
        %个数加一
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %死伤个数相加
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    %若不行不同，则temp变化，换行，个数加一，死伤个数相加
    else
        %换行
        temp = group(i,4);
        i_type = i_type + 1;
        %个数加一
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %死伤个数相加
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    end
    TypeData(i_type,1) = temp;
end
%计算事故率
sum_accident= sum(TypeData(:,2));
TypeData(:,5) = TypeData(:,2)/sum_accident;
%计算死亡率
sum_DH = TypeData(:,3) + TypeData(:,4);
TypeData(:,6) = TypeData(:,3) ./ sum_DH;
%将NaN变为0
TypeData(isnan(TypeData)) = 0;

TypeData_Old = TypeData;

%可以用于绘图的数据
clearvars -except TypeData_Young TypeData_Middle TypeData_Old ;
save PicData.mat