%输入：
%data_people
%输出：
%天气（2种）、年龄段（3种）、性别（2种）、星期（7种）、事故形态（5种），保存为excel
function [data_logistic_new] = LogisticData(data_people) 
    
    %筛选年龄
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
    
    %将年龄离散化：青年1，中年2，老年3
    group_young(:,6) = 1;
    group_middle(:,6) = 2;
    group_old(:,6) = 3;
    
    data_logistic = [group_young; group_middle; group_old];
    
    %剔除不需要的事故形态
    [m_logistic, n_logistic] = size(data_logistic);
    i_new = 1;
    for i = 1:m_logistic
        if data_logistic(i,4) == 11 || data_logistic(i,4) == 12 || data_logistic(i,4) == 19 || data_logistic(i,4) == 21 || data_logistic(i,4) == 35
            data_logistic_new(i_new,:) = data_logistic(i,:);
            i_new = i_new +1;
        end
    end
   
    %调整位置
    %事故形态放到最后
    data_logistic_new(:,10) = data_logistic_new(:,4);
    %删掉第7,8,9列：死亡人数、受伤人数、label
    data_logistic_new(:,7:9) = [];
    %删掉第4列事故形态
    data_logistic_new(:,4) = [];
    %删掉第2列日期编号
    data_logistic_new(:,2) = [];
    
    %保存为excel
    xlswrite('data_logistic.xlsx',data_logistic_new);
end