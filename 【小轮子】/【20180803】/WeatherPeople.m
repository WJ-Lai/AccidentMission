%���룺
%δ������������
%�����
%�����������ݷֿ�
function [sun_people, rain_people] = WeatherPeople(data_people)

    [m_people, n_people] = size(data_people);

    %peopleʱ��0Ϊ���죬1Ϊ����
    data_people = sortrows(data_people,1);
    sun_people = data_people(1:numel(find(data_people(:,1)==0)),:);
    rain_people = data_people(numel(find(data_people(:,1)==0))+1:m_people,:);
   

end