%���룺
%���ݼ��������λ�á���������ε������Сֵ
%�����
%���ֺõ���������������

function [group_young, group_middle, group_old] = DifferentYearGroup(data, year_location, young_min, young_max, middle_min, middle_max, old_min, old_max)

group_young = [];
i_young = 1;
group_middle = [];
i_middle = 1;
group_old = [];
i_old = 1;

[m, n] = size(data);
for i = 1:m
    %�����飨18~30��
    if data(i,year_location) >= young_min && data(i,year_location) <=young_max
        group_young(i_young,:) = data(i,:);
        i_young = i_young + 1;
    end
    
    %�����飨40~50��
    if data(i,year_location) >= middle_min && data(i,year_location) <= middle_max
        group_middle(i_middle,:) = data(i,:);
        i_middle = i_middle + 1;
    end
    
    %�����飨60~��
    if data(i,year_location) >= old_min && data(i,year_location) <= old_max 
        group_old(i_old,:) = data(i,:);
        i_old = i_old + 1;
    end
end

end