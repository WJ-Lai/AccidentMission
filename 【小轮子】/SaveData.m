%���룺
%��ȡ������������people��week����
%�����
%������������ʡ������ʡ�����������spss���ݲ�����
function [] = SaveData(n,people_young_extract, people_middle_extract, people_old_extract, week_young_extract, week_middle_extract, week_old_extract)

    if n == 1
        %ɢ��ͼ��Ҫ�����ݣ�
        %sun_X�����¹��ʡ��������������˸���
        %��������� = ����/����
        sun1 = [people_young_extract(:,1),people_young_extract(:,2)./people_young_extract(:,3),people_middle_extract(:,1),people_middle_extract(:,2)./ people_middle_extract(:,3),people_old_extract(:,1),people_old_extract(:,2)./people_old_extract(:,3)];  %��ֻ���¹��ʺ���������
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\sun1.xlsx',sun1);
        %������ = ����/������+���ˣ�
        sun2 = [people_young_extract(:,1),people_young_extract(:,2)./(people_young_extract(:,2)+people_young_extract(:,3)),people_middle_extract(:,1),people_middle_extract(:,2)./ (people_middle_extract(:,2)+people_middle_extract(:,3)),people_old_extract(:,1),people_old_extract(:,2)./(people_old_extract(:,2)+people_old_extract(:,3))];  %��ֻ���¹��ʺ���������
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\sun2.xlsx',sun2);
        %�������� = ����
        sun3 = [people_young_extract(:,1),people_young_extract(:,2),people_middle_extract(:,1),people_middle_extract(:,2),people_old_extract(:,1),people_old_extract(:,2)];  %��ֻ���¹��ʺ���������
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\sun3.xlsx',sun3);

        %����ͼ�͵���������Ҫ����
        %data_n_week��ֱ������spss
        %����
        sun_spss1 = week_young_extract;
        sun_spss1(isnan(sun_spss1)) = 0;
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\sun_week_young.xlsx',sun_spss1);

        %����
        sun_spss2 = week_middle_extract;
        sun_spss2(isnan(sun_spss2)) = 0;
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\sun_week_middle.xlsx',sun_spss2);

        %����
        sun_spss3 = week_old_extract;
        sun_spss3(isnan(sun_spss3)) = 0;
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\sun_week_old.xlsx',sun_spss3);
    end
    
    if n == 2
        %ɢ��ͼ��Ҫ�����ݣ�
        %sun_X�����¹��ʡ��������������˸���
        %��������� = ����/����
        sun1 = [people_young_extract(:,1),people_young_extract(:,2)./people_young_extract(:,3),people_middle_extract(:,1),people_middle_extract(:,2)./ people_middle_extract(:,3),people_old_extract(:,1),people_old_extract(:,2)./people_old_extract(:,3)];  %��ֻ���¹��ʺ���������
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\rain1.xlsx',sun1);
        %������ = ����/������+���ˣ�
        sun2 = [people_young_extract(:,1),people_young_extract(:,2)./(people_young_extract(:,2)+people_young_extract(:,3)),people_middle_extract(:,1),people_middle_extract(:,2)./ (people_middle_extract(:,2)+people_middle_extract(:,3)),people_old_extract(:,1),people_old_extract(:,2)./(people_old_extract(:,2)+people_old_extract(:,3))];  %��ֻ���¹��ʺ���������
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\rain2.xlsx',sun2);
        %�������� = ����
        sun3 = [people_young_extract(:,1),people_young_extract(:,2),people_middle_extract(:,1),people_middle_extract(:,2),people_old_extract(:,1),people_old_extract(:,2)];  %��ֻ���¹��ʺ���������
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\rain3.xlsx',sun3);

        %����ͼ�͵���������Ҫ����
        %data_n_week��ֱ������spss
        %����
        sun_spss1 = week_young_extract;
        sun_spss1(isnan(sun_spss1)) = 0;
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\rain_week_young.xlsx',sun_spss1);

        %����
        sun_spss2 = week_middle_extract;
        sun_spss2(isnan(sun_spss2)) = 0;
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\rain_week_middle.xlsx',sun_spss2);

        %����
        sun_spss3 = week_old_extract;
        sun_spss3(isnan(sun_spss3)) = 0;
        xlswrite('G:\study\2018���\��������������\For Weijian_20180704\����\�����ݡ�\rain_week_old.xlsx',sun_spss3);
    end
end