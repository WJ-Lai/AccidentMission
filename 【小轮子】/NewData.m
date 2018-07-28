%���룺
%����label���ݼ�
%�����
%��ͬһ�ܵ��¹��ںϣ������µ�����new_data����ͳ�Ʋ�ͬ�¹���̬�����˸���
function new_data = NewData(data)
    
    %ɾ������NAN����
    data(isnan(data(:,4)),:)=[];
    data(isnan(data(:,6)),:)=[];
    %��ʼ����47��
    new_data = zeros(1,47);
    [m n] = size(data);
    %��¼��ǰ��label
    t_label = data(1,9);
    %��¼new_data����λ��
    loc_new_data = 1;
    %��Ϊ��һ������ʱ����ų��ֹ�������
    week = [];
    num_label1 = 1;
    
    for i = 1:m
        
        %�ж��Ƿ���Ϊͬһlabel
        if data(i,9) == t_label
            %���ǣ��������
            %AccidentType()���������¹���̬��λ��
            loc_accident = AccidentType(data(i,4));
            %������������
            new_data(loc_new_data,1+loc_accident) = new_data(loc_new_data,1+loc_accident) + data(i,7);
            %������������
            new_data(loc_new_data,24+loc_accident) = new_data(loc_new_data,24+loc_accident) + data(i,8);
            
            %ÿ�ζ�����ǰ�����ںż�¼��
            week = [week; data(i,3)];
            
        %�����ǣ�������labelʱ�����ݣ�����new_data����   
        else
            %ԭlabel��������¼label
            new_data(loc_new_data,1) = t_label;
            %��ԭ����labelΪ1��5
            if t_label == 1 || t_label == 5
                %ͳ�Ƴ��ֵ�����
                num_label1 = numel(unique(week));
                %��������
                new_data(loc_new_data,2:47) = new_data(loc_new_data,2:47)/num_label1;
            %���Ǳ�Ϊ�����������գ���ԭ���������仯����������ݼ���
            end
            %����
            t_label = data(i,9);
            loc_new_data = loc_new_data + 1;   
            %AccidentType()���������¹���̬��λ��
            loc_accident = AccidentType(data(i,4));
            %������������
            new_data(loc_new_data,1+loc_accident) = data(i,7);
            %������������
            new_data(loc_new_data,24+loc_accident) = data(i,8);
           %��Ϊ��һ������ʱ����ų��ֹ�������
            week = [];
            week = [week; data(i,3)];
            num_label1 = 1;

        end
    
    end
    %ԭlabel��������¼label
    new_data(loc_new_data,1) = t_label;
    if t_label == 1 || t_label == 5
        %ͳ�Ƴ��ֵ�����
        num_label1 = numel(unique(week));
        %��������
        new_data(loc_new_data,2:47) = new_data(loc_new_data,2:47)/num_label1;
    end
end