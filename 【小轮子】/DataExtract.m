%输入：
%两种不同格式的数据集合、最重要的事故形态id、提取个数n
%输出：
%事故率、死亡个数、受伤个数、提取后事故形态后的数据集合

function [data_n_people, data_n_week] = DataExtract(data_people, data_week, id_death, n)

    [m_people, n_people] = size(data_people);
    [m_week, n_week] = size(data_week);
    num_typt = [11 12 13 19 21 22 23 29 30 31 32 33 34 35 36 37 38 40 50 60 70 80 99];
    
    %针对people数据，先计算事故率、死亡个数、受伤个数，然后筛选目标数据

    %计算事故率
    for i_tpye = 1:23
        %顺序为num_type内顺序
        acc_rate(i_tpye,1) = numel(find(data_people(:,4) == num_typt(i_tpye)))/m_people;
    end
    deaths = zeros(23,1);
    hurts = zeros(23,1);
    %计算死亡个数、受伤个数
    for i = 1:m_people
        for i_type = 1:23
            if data_people(i,4) == num_typt(i_type)
                %顺序为num_type内顺序
                deaths(i_type,1) = deaths(i_type,1) + data_people(i,7);
                hurts(i_type,1) = hurts(i_type,1) + data_people(i,8);
            end
        end
    end
    
    %提取前n个
    data_n_people(:,1) = acc_rate(id_death(1:n));
    data_n_people(:,2) = deaths(id_death(1:n));
    data_n_people(:,3) = hurts(id_death(1:n));
    
    %针对week数据，直接筛选目标数据
    data_n_week = zeros(m_week,1+n*2);
    data_n_week(:,1) = data_week(:,1);
    for i_week = 1:n
        %死亡人数
        data_n_week(:,1+i_week) = data_week(:,1 + id_death(i_week));
        %受伤人数
        data_n_week(:,6+i_week) = data_week(:,24 + id_death(i_week));
    end
    %死亡率(非准确)
    data_n_week(:,12:16) = data_n_week(:,2:6)./(data_n_week(:,2:6)+data_n_week(:,7:11));

end