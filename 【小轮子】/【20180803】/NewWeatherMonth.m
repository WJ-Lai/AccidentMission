%输入：
%为提炼样本的数据集，第1列为天气，第3列为星期，4为事故形态，7为人数
%输出：
%每个样本为一个月，雨天平均和晴天平均
function [ data_week] = NewWeatherMonth(data_with_label)

    
    [m , n] = size(data_with_label);
    
    sun = zeros(1,23);
    rain = zeros(1,23);
    i_label = 1;
    new_data = zeros(1,23);
    %若上一天是星期日且下一天是星期一，则认为一周结束，变为1
    sign_week = 0;
    
    for i = 1:m
        
        %判断一周是否结束
        if i ~= 1
            if data_with_label(i, 3)==1 && data_with_label(i-1, 3)==7
                sign_week = sign_week + 1;
            end
        end
        
        %如果一个月结束
        if sign_week == 4
            %首先计算上一月的死亡人数比
            new_data(i_label,:) = rain ./sun;
            %换行
            i_label = i_label+1;
            %重置
            sun = zeros(1,23);
            rain = zeros(1,23);  
            sign_week = 0;
        end
        
        %统计死亡人数
        %判断天气
        if data_with_label(i, 1) ==0
            sun = CalculateDeath(data_with_label(i, :), sun);
        %若为雨天
        else
            rain = CalculateDeath(data_with_label(i, :), rain);
        end
    end
    new_data(i_label,:) = rain./ sun;
    
    data_week = new_data;
end