%���룺
%���ֲ�ͬ��ʽ�����ݼ��ϡ�����Ҫ���¹���̬id����ȡ����n
%�����
%�¹��ʡ��������������˸�������ȡ���¹���̬������ݼ���

function [data_n_people, data_n_week] = DataExtract(data_people, data_week, id_death, n)

    [m_people, n_people] = size(data_people);
    [m_week, n_week] = size(data_week);
    num_typt = [11 12 13 19 21 22 23 29 30 31 32 33 34 35 36 37 38 40 50 60 70 80 99];
    
    %���people���ݣ��ȼ����¹��ʡ��������������˸�����Ȼ��ɸѡĿ������

    %�����¹���
    for i_tpye = 1:23
        %˳��Ϊnum_type��˳��
        acc_rate(i_tpye,1) = numel(find(data_people(:,4) == num_typt(i_tpye)))/m_people;
    end
    deaths = zeros(23,1);
    hurts = zeros(23,1);
    %�����������������˸���
    for i = 1:m_people
        for i_type = 1:23
            if data_people(i,4) == num_typt(i_type)
                %˳��Ϊnum_type��˳��
                deaths(i_type,1) = deaths(i_type,1) + data_people(i,7);
                hurts(i_type,1) = hurts(i_type,1) + data_people(i,8);
            end
        end
    end
    
    %��ȡǰn��
    data_n_people(:,1) = acc_rate(id_death(1:n));
    data_n_people(:,2) = deaths(id_death(1:n));
    data_n_people(:,3) = hurts(id_death(1:n));
    
    %���week���ݣ�ֱ��ɸѡĿ������
    data_n_week = zeros(m_week,1+n*2);
    data_n_week(:,1) = data_week(:,1);
    for i_week = 1:n
        %��������
        data_n_week(:,1+i_week) = data_week(:,1 + id_death(i_week));
        %��������
        data_n_week(:,6+i_week) = data_week(:,24 + id_death(i_week));
    end
    %������(��׼ȷ)
    data_n_week(:,12:16) = data_n_week(:,2:6)./(data_n_week(:,2:6)+data_n_week(:,7:11));

end