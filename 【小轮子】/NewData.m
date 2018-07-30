%输入：
%标有label数据集
%输出：
%将同一周的事故融合，生成新的样本new_data，并统计不同事故形态的死伤个数
function data_week = NewData(data_people)
    
    %删除包含NAN的行
    data_people(isnan(data_people(:,4)),:)=[];
    data_people(isnan(data_people(:,6)),:)=[];
    %初始化：47列
    data_week = zeros(1,47);
    [m n] = size(data_people);
    %记录当前的label
    t_label = data_people(1,9);
    %记录new_data的行位置
    loc_new_data = 1;
    %当为周一到周四时，存放出现过的星期
    week = [];
    num_label1 = 1;
    
    for i = 1:m
        
        %判断是否仍为同一label
        if data_people(i,9) == t_label
            %若是，则加人数
            %AccidentType()返回属于事故形态的位置
            loc_accident = AccidentType(data_people(i,4));
            %计算死亡人数
            data_week(loc_new_data,1+loc_accident) = data_week(loc_new_data,1+loc_accident) + data_people(i,7);
            %计算受伤人数
            data_week(loc_new_data,24+loc_accident) = data_week(loc_new_data,24+loc_accident) + data_people(i,8);
            
            %每次都将当前的星期号记录下
            week = [week; data_people(i,3)];
            
        %若不是，则清算label时的数据，并且new_data换行   
        else
            %原label结束，记录label
            data_week(loc_new_data,1) = t_label;
            %若原来的label为1或5
            if t_label == 1 || t_label == 5
                %统计出现的天数
                num_label1 = numel(unique(week));
                %除以天数
                data_week(loc_new_data,2:47) = data_week(loc_new_data,2:47)/num_label1;
            %若是变为周五周六周日，则原来不发生变化，添加新数据即可
            end
            %换行
            t_label = data_people(i,9);
            loc_new_data = loc_new_data + 1;   
            %AccidentType()返回属于事故形态的位置
            loc_accident = AccidentType(data_people(i,4));
            %计算死亡人数
            data_week(loc_new_data,1+loc_accident) = data_people(i,7);
            %计算受伤人数
            data_week(loc_new_data,24+loc_accident) = data_people(i,8);
           %当为周一到周四时，存放出现过的星期
            week = [];
            week = [week; data_people(i,3)];
            num_label1 = 1;

        end
    
    end
    %原label结束，记录label
    data_week(loc_new_data,1) = t_label;
    if t_label == 1 || t_label == 5
        %统计出现的天数
        num_label1 = numel(unique(week));
        %除以天数
        data_week(loc_new_data,2:47) = data_week(loc_new_data,2:47)/num_label1;
    end
end