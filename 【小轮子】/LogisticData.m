%���룺
%data_people
%�����
%������2�֣�������Σ�3�֣����Ա�2�֣������ڣ�7�֣����¹���̬��5�֣�������Ϊexcel
function [data_logistic_new] = LogisticData(data_people) 
    
    %ɸѡ����
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
    
    %��������ɢ��������1������2������3
    group_young(:,6) = 1;
    group_middle(:,6) = 2;
    group_old(:,6) = 3;
    
    data_logistic = [group_young; group_middle; group_old];
    
    %�޳�����Ҫ���¹���̬
    [m_logistic, n_logistic] = size(data_logistic);
    i_new = 1;
    for i = 1:m_logistic
        if data_logistic(i,4) == 11 || data_logistic(i,4) == 12 || data_logistic(i,4) == 19 || data_logistic(i,4) == 21 || data_logistic(i,4) == 35
            data_logistic_new(i_new,:) = data_logistic(i,:);
            i_new = i_new +1;
        end
    end
   
    %����λ��
    %�¹���̬�ŵ����
    data_logistic_new(:,10) = data_logistic_new(:,4);
    %ɾ����7,8,9�У���������������������label
    data_logistic_new(:,7:9) = [];
    %ɾ����4���¹���̬
    data_logistic_new(:,4) = [];
    %ɾ����2�����ڱ��
    data_logistic_new(:,2) = [];
    
    %����Ϊexcel
    xlswrite('data_logistic.xlsx',data_logistic_new);
end