%输入：
%未分天气的数据
%输出：
%雨天晴天数据分开
function [sun_people, rain_people, sun_week, rain_week] = Weather(data_people, data_week)

    [m_people, n_people] = size(data_people);
    [m_week, n_week] = size(data_week);

    %people时，0为晴天，1为阴天
    data_people = sortrows(data_people,1);
    sun_people = data_people(1:numel(find(data_people(:,1)==0)),:);
    rain_people = data_people(numel(find(data_people(:,1)==0))+1:m_people,:);
    
    %week时，1234为晴天，5678为阴天
    data_week= sortrows(data_week,1);
    %找到5的位置
    [m_5, n_5] = find(data_week(:,1)== 5);
    sun_week = data_week(1:m_5-1,:);
    rain_week = data_week(m_5:m_week,:);

end