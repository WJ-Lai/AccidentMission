%输入：
%未分天气的数据
%输出：
%雨天晴天数据分开
function [sun_people, rain_people] = WeatherPeople(data_people)

    [m_people, n_people] = size(data_people);

    %people时，0为晴天，1为阴天
    data_people = sortrows(data_people,1);
    sun_people = data_people(1:numel(find(data_people(:,1)==0)),:);
    rain_people = data_people(numel(find(data_people(:,1)==0))+1:m_people,:);
   

end