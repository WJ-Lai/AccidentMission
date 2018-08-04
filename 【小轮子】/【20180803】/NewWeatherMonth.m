%���룺
%Ϊ�������������ݼ�����1��Ϊ��������3��Ϊ���ڣ�4Ϊ�¹���̬��7Ϊ����
%�����
%ÿ������Ϊһ���£�����ƽ��������ƽ��
function [ data_week] = NewWeatherMonth(data_with_label)

    
    [m , n] = size(data_with_label);
    
    sun = zeros(1,23);
    rain = zeros(1,23);
    i_label = 1;
    new_data = zeros(1,23);
    %����һ��������������һ��������һ������Ϊһ�ܽ�������Ϊ1
    sign_week = 0;
    
    for i = 1:m
        
        %�ж�һ���Ƿ����
        if i ~= 1
            if data_with_label(i, 3)==1 && data_with_label(i-1, 3)==7
                sign_week = sign_week + 1;
            end
        end
        
        %���һ���½���
        if sign_week == 4
            %���ȼ�����һ�µ�����������
            new_data(i_label,:) = rain ./sun;
            %����
            i_label = i_label+1;
            %����
            sun = zeros(1,23);
            rain = zeros(1,23);  
            sign_week = 0;
        end
        
        %ͳ����������
        %�ж�����
        if data_with_label(i, 1) ==0
            sun = CalculateDeath(data_with_label(i, :), sun);
        %��Ϊ����
        else
            rain = CalculateDeath(data_with_label(i, :), rain);
        end
    end
    new_data(i_label,:) = rain./ sun;
    
    data_week = new_data;
end