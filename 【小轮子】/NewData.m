%���룺
%����label���ݼ�
%�����
%��ͬһ�ܵ��¹��ںϣ������µ�����new_data����ͳ�Ʋ�ͬ�¹���̬�����˸���
function data_week = NewData(data_people)
    
    %ɾ������NAN����
    data_people(isnan(data_people(:,4)),:)=[];
    data_people(isnan(data_people(:,6)),:)=[];
    %��ʼ����47��
    data_week = zeros(1,47);
    [m n] = size(data_people);
    %��¼��ǰ��label
    t_label = data_people(1,9);
    %��¼new_data����λ��
    loc_new_data = 1;
    %��Ϊ��һ������ʱ����ų��ֹ�������
    week = [];
    num_label1 = 1;
    
    for i = 1:m
        
        %�ж��Ƿ���Ϊͬһlabel
        if data_people(i,9) == t_label
            %���ǣ��������
            %AccidentType()���������¹���̬��λ��
            loc_accident = AccidentType(data_people(i,4));
            %������������
            data_week(loc_new_data,1+loc_accident) = data_week(loc_new_data,1+loc_accident) + data_people(i,7);
            %������������
            data_week(loc_new_data,24+loc_accident) = data_week(loc_new_data,24+loc_accident) + data_people(i,8);
            
            %ÿ�ζ�����ǰ�����ںż�¼��
            week = [week; data_people(i,3)];
            
        %�����ǣ�������labelʱ�����ݣ�����new_data����   
        else
            %ԭlabel��������¼label
            data_week(loc_new_data,1) = t_label;
            %��ԭ����labelΪ1��5
            if t_label == 1 || t_label == 5
                %ͳ�Ƴ��ֵ�����
                num_label1 = numel(unique(week));
                %��������
                data_week(loc_new_data,2:47) = data_week(loc_new_data,2:47)/num_label1;
            %���Ǳ�Ϊ�����������գ���ԭ���������仯����������ݼ���
            end
            %����
            t_label = data_people(i,9);
            loc_new_data = loc_new_data + 1;   
            %AccidentType()���������¹���̬��λ��
            loc_accident = AccidentType(data_people(i,4));
            %������������
            data_week(loc_new_data,1+loc_accident) = data_people(i,7);
            %������������
            data_week(loc_new_data,24+loc_accident) = data_people(i,8);
           %��Ϊ��һ������ʱ����ų��ֹ�������
            week = [];
            week = [week; data_people(i,3)];
            num_label1 = 1;

        end
    
    end
    %ԭlabel��������¼label
    data_week(loc_new_data,1) = t_label;
    if t_label == 1 || t_label == 5
        %ͳ�Ƴ��ֵ�����
        num_label1 = numel(unique(week));
        %��������
        data_week(loc_new_data,2:47) = data_week(loc_new_data,2:47)/num_label1;
    end
end