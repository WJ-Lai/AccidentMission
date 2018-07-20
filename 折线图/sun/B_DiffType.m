%����ͬ���ͷֿ�
clc;clear;
load dataAge.mat;

%%
%������
group = Young;
%�д���ͬ���ͣ��зֱ�Ϊ���ʹ��롢�����������˸�����������
TypeData = zeros(23,6);
i_type = 1;
%����NaN����
[m_NaN,n_NaN]=find(isnan(group)); % �ҳ�NaN����λ��
group(m_NaN,:)=[]; %ɾ������NaN���У�x(:,n)=[]����ɾ����
%����
[m, n] = size(group);
group = sortrows(group,4);
temp = group(1,4);
for i = 1:m
    %��������ͬ���������һ�������˸������
    if group(i,4) == temp
        %������һ
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %���˸������
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    %�����в�ͬ����temp�仯�����У�������һ�����˸������
    else
        %����
        temp = group(i,4);
        i_type = i_type + 1;
        %������һ
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %���˸������
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    end
    TypeData(i_type,1) = temp;
end
%�����¹���
sum_accident= sum(TypeData(:,2));
TypeData(:,5) = TypeData(:,2)/sum_accident;
%����������
sum_DH = TypeData(:,3) + TypeData(:,4);
TypeData(:,6) = TypeData(:,3) ./ sum_DH;
%��NaN��Ϊ0
TypeData(isnan(TypeData)) = 0;

TypeData_Young = TypeData;

%%
%������
group = Middle;
%�д���ͬ���ͣ��зֱ�Ϊ���ʹ��롢�����������˸�����������
TypeData = zeros(23,6);
i_type = 1;
%����NaN����
[m_NaN,n_NaN]=find(isnan(group)); % �ҳ�NaN����λ��
group(m_NaN,:)=[]; %ɾ������NaN���У�x(:,n)=[]����ɾ����
%����
[m, n] = size(group);
group = sortrows(group,4);
temp = group(1,4);
for i = 1:m
    %��������ͬ���������һ�������˸������
    if group(i,4) == temp
        %������һ
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %���˸������
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    %�����в�ͬ����temp�仯�����У�������һ�����˸������
    else
        %����
        temp = group(i,4);
        i_type = i_type + 1;
        %������һ
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %���˸������
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    end
    TypeData(i_type,1) = temp;
end
%�����¹���
sum_accident= sum(TypeData(:,2));
TypeData(:,5) = TypeData(:,2)/sum_accident;
%����������
sum_DH = TypeData(:,3) + TypeData(:,4);
TypeData(:,6) = TypeData(:,3) ./ sum_DH;
%��NaN��Ϊ0
TypeData(isnan(TypeData)) = 0;

TypeData_Middle = TypeData;

%%
%������
group = Old;
%�д���ͬ���ͣ��зֱ�Ϊ���ʹ��롢�����������˸�����������
TypeData = zeros(23,6);
i_type = 1;
%����NaN����
[m_NaN,n_NaN]=find(isnan(group)); % �ҳ�NaN����λ��
group(m_NaN,:)=[]; %ɾ������NaN���У�x(:,n)=[]����ɾ����
%����
[m, n] = size(group);
group = sortrows(group,4);
temp = group(1,4);
for i = 1:m
    %��������ͬ���������һ�������˸������
    if group(i,4) == temp
        %������һ
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %���˸������
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    %�����в�ͬ����temp�仯�����У�������һ�����˸������
    else
        %����
        temp = group(i,4);
        i_type = i_type + 1;
        %������һ
        TypeData(i_type,2) = TypeData(i_type,2) + 1;  
        %���˸������
        TypeData(i_type,3) = TypeData(i_type,3) + group(i,5);
        TypeData(i_type,4) = TypeData(i_type,4) + group(i,6);
    end
    TypeData(i_type,1) = temp;
end
%�����¹���
sum_accident= sum(TypeData(:,2));
TypeData(:,5) = TypeData(:,2)/sum_accident;
%����������
sum_DH = TypeData(:,3) + TypeData(:,4);
TypeData(:,6) = TypeData(:,3) ./ sum_DH;
%��NaN��Ϊ0
TypeData(isnan(TypeData)) = 0;

TypeData_Old = TypeData;

%�������ڻ�ͼ������
clearvars -except TypeData_Young TypeData_Middle TypeData_Old ;
save PicData.mat