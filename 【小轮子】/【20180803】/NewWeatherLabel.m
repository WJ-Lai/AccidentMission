%输入：
%旧：第1列为天气，第3列为星期，4为事故形态，7为人数
%为提炼样本的数据集，第7列为天气，第1列为星期，2为事故形态，5为死亡人数
%输出：
%每个样本为一个星期，晴雨天分开，sun和rain为每周每天的事故数
function [sun_week, rain_week] = NewWeatherLabel(data_people)

    
    [m , n] = size(data_people);
    
    sun = zeros(1,23);
    num_sun = 0;
    sun_weeklabel = [];
    rain = zeros(1,23);
    num_rain = 0;
    rain_weeklabel = [];
    i_label = 1;
    new_data = zeros(1,23);
    %若上一天是星期日且下一天是星期一，则认为一周结束，变为1
    sign_week = 0;
    
    for i = 1:m
        
        %判断一周是否结束
        if i ~= 1
            if data_people(i, 3) < data_people(i-1, 3)
                sign_week = 1;
            end
        end
        
        %如果一周结束
        if sign_week == 1  
            %首先计算上一周平均每天死亡人数
            num_sun = numel(unique(sun_weeklabel));
            if num_sun ~= 0
                sun_week(i_label,:) = sun/num_sun;
            end
            num_rain = numel(unique(rain_weeklabel));
            if num_rain ~= 0
                rain_week(i_label,:)  = rain/num_rain;
            end
            %换行
            i_label = i_label+1;
            %重置
            sun = zeros(1,23);
            num_sun = 0;
            sun_weeklabel = [];
            rain = zeros(1,23);
            num_rain = 0;
            rain_weeklabel = [];
            sign_week = 0;
        end
        
        %统计死亡人数
        %判断天气
        if data_people(i, 1) ==0
            sun = CalculateDeath(data_people(i, :), sun);
            
            %若矩阵为空，则将星期插入
            if isempty(sun_weeklabel)
                sun_weeklabel = data_people(i, 3);
            %若不为空，判断矩阵内是否有相同元素
            elseif ~ismember(data_people(i, 3),sun_weeklabel)
                %若不存在，则将其插入
                sun_weeklabel = [sun_weeklabel , data_people(i, 3)];
            end
        %若为雨天
        else
            rain = CalculateDeath(data_people(i, :), rain);
            
            %若矩阵为空，则将星期插入
            if isempty(rain_weeklabel)
                rain_weeklabel = data_people(i, 3);
            %若不为空，判断矩阵内是否有相同元素
            elseif ~ismember(data_people(i, 3),rain_weeklabel)
                %若不存在，则将其插入
                rain_weeklabel = [rain_weeklabel , data_people(i, 3)];
            end
        end
    end
    
    num_sun = numel(unique(sun_weeklabel));
    if num_sun ~= 0
        sun_week(i_label,:) = sun/num_sun;
    else
        sun_week(i_label,:) = 0;
    end
    num_rain = numel(unique(rain_weeklabel));
    if num_rain ~= 0
        rain_week(i_label,:)  = rain/num_rain;
    else
        rain_week(i_label,:) = 0;
    end

end