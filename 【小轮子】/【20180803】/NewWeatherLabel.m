%���룺
%�ɣ���1��Ϊ��������3��Ϊ���ڣ�4Ϊ�¹���̬��7Ϊ����
%Ϊ�������������ݼ�����7��Ϊ��������1��Ϊ���ڣ�2Ϊ�¹���̬��5Ϊ��������
%�����
%ÿ������Ϊһ�����ڣ�������ֿ���sun��rainΪÿ��ÿ����¹���
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
    %����һ��������������һ��������һ������Ϊһ�ܽ�������Ϊ1
    sign_week = 0;
    
    for i = 1:m
        
        %�ж�һ���Ƿ����
        if i ~= 1
            if data_people(i, 3) < data_people(i-1, 3)
                sign_week = 1;
            end
        end
        
        %���һ�ܽ���
        if sign_week == 1  
            %���ȼ�����һ��ƽ��ÿ����������
            num_sun = numel(unique(sun_weeklabel));
            if num_sun ~= 0
                sun_week(i_label,:) = sun/num_sun;
            end
            num_rain = numel(unique(rain_weeklabel));
            if num_rain ~= 0
                rain_week(i_label,:)  = rain/num_rain;
            end
            %����
            i_label = i_label+1;
            %����
            sun = zeros(1,23);
            num_sun = 0;
            sun_weeklabel = [];
            rain = zeros(1,23);
            num_rain = 0;
            rain_weeklabel = [];
            sign_week = 0;
        end
        
        %ͳ����������
        %�ж�����
        if data_people(i, 1) ==0
            sun = CalculateDeath(data_people(i, :), sun);
            
            %������Ϊ�գ������ڲ���
            if isempty(sun_weeklabel)
                sun_weeklabel = data_people(i, 3);
            %����Ϊ�գ��жϾ������Ƿ�����ͬԪ��
            elseif ~ismember(data_people(i, 3),sun_weeklabel)
                %�������ڣ��������
                sun_weeklabel = [sun_weeklabel , data_people(i, 3)];
            end
        %��Ϊ����
        else
            rain = CalculateDeath(data_people(i, :), rain);
            
            %������Ϊ�գ������ڲ���
            if isempty(rain_weeklabel)
                rain_weeklabel = data_people(i, 3);
            %����Ϊ�գ��жϾ������Ƿ�����ͬԪ��
            elseif ~ismember(data_people(i, 3),rain_weeklabel)
                %�������ڣ��������
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