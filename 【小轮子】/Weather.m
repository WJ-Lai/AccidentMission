%���룺
%δ������������
%�����
%�����������ݷֿ�
function [sun_people, rain_people, sun_week, rain_week] = Weather(data_people, data_week)

    [m_people, n_people] = size(data_people);
    [m_week, n_week] = size(data_week);

    %peopleʱ��0Ϊ���죬1Ϊ����
    data_people = sortrows(data_people,1);
    sun_people = data_people(1:numel(find(data_people(:,1)==0)),:);
    rain_people = data_people(numel(find(data_people(:,1)==0))+1:m_people,:);
    
    %weekʱ��1234Ϊ���죬5678Ϊ����
    data_week= sortrows(data_week,1);
    %�ҵ�5��λ��
    [m_5, n_5] = find(data_week(:,1)== 5);
    sun_week = data_week(1:m_5-1,:);
    rain_week = data_week(m_5:m_week,:);

end