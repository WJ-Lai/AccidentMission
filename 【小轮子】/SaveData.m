%输入：
%提取后的三种年龄段people和week数据
%输出：
%计算相对死亡率、死亡率、死亡个数、spss数据并保存
function [] = SaveData(n,people_young_extract, people_middle_extract, people_old_extract, week_young_extract, week_middle_extract, week_old_extract)

    if n == 1
        %散点图需要的数据：
        %sun_X里面事故率、死亡个数、受伤个数
        %相对死亡率 = 死亡/受伤
        sun1 = [people_young_extract(:,1),people_young_extract(:,2)./people_young_extract(:,3),people_middle_extract(:,1),people_middle_extract(:,2)./ people_middle_extract(:,3),people_old_extract(:,1),people_old_extract(:,2)./people_old_extract(:,3)];  %若只需事故率和死亡个数
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\sun1.xlsx',sun1);
        %死亡率 = 死亡/（死亡+受伤）
        sun2 = [people_young_extract(:,1),people_young_extract(:,2)./(people_young_extract(:,2)+people_young_extract(:,3)),people_middle_extract(:,1),people_middle_extract(:,2)./ (people_middle_extract(:,2)+people_middle_extract(:,3)),people_old_extract(:,1),people_old_extract(:,2)./(people_old_extract(:,2)+people_old_extract(:,3))];  %若只需事故率和死亡个数
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\sun2.xlsx',sun2);
        %死亡个数 = 死亡
        sun3 = [people_young_extract(:,1),people_young_extract(:,2),people_middle_extract(:,1),people_middle_extract(:,2),people_old_extract(:,1),people_old_extract(:,2)];  %若只需事故率和死亡个数
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\sun3.xlsx',sun3);

        %折线图和调和曲线需要数据
        %data_n_week内直接用于spss
        %青年
        sun_spss1 = week_young_extract;
        sun_spss1(isnan(sun_spss1)) = 0;
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\sun_week_young.xlsx',sun_spss1);

        %中年
        sun_spss2 = week_middle_extract;
        sun_spss2(isnan(sun_spss2)) = 0;
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\sun_week_middle.xlsx',sun_spss2);

        %老年
        sun_spss3 = week_old_extract;
        sun_spss3(isnan(sun_spss3)) = 0;
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\sun_week_old.xlsx',sun_spss3);
    end
    
    if n == 2
        %散点图需要的数据：
        %sun_X里面事故率、死亡个数、受伤个数
        %相对死亡率 = 死亡/受伤
        sun1 = [people_young_extract(:,1),people_young_extract(:,2)./people_young_extract(:,3),people_middle_extract(:,1),people_middle_extract(:,2)./ people_middle_extract(:,3),people_old_extract(:,1),people_old_extract(:,2)./people_old_extract(:,3)];  %若只需事故率和死亡个数
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\rain1.xlsx',sun1);
        %死亡率 = 死亡/（死亡+受伤）
        sun2 = [people_young_extract(:,1),people_young_extract(:,2)./(people_young_extract(:,2)+people_young_extract(:,3)),people_middle_extract(:,1),people_middle_extract(:,2)./ (people_middle_extract(:,2)+people_middle_extract(:,3)),people_old_extract(:,1),people_old_extract(:,2)./(people_old_extract(:,2)+people_old_extract(:,3))];  %若只需事故率和死亡个数
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\rain2.xlsx',sun2);
        %死亡个数 = 死亡
        sun3 = [people_young_extract(:,1),people_young_extract(:,2),people_middle_extract(:,1),people_middle_extract(:,2),people_old_extract(:,1),people_old_extract(:,2)];  %若只需事故率和死亡个数
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\rain3.xlsx',sun3);

        %折线图和调和曲线需要数据
        %data_n_week内直接用于spss
        %青年
        sun_spss1 = week_young_extract;
        sun_spss1(isnan(sun_spss1)) = 0;
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\rain_week_young.xlsx',sun_spss1);

        %中年
        sun_spss2 = week_middle_extract;
        sun_spss2(isnan(sun_spss2)) = 0;
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\rain_week_middle.xlsx',sun_spss2);

        %老年
        sun_spss3 = week_old_extract;
        sun_spss3(isnan(sun_spss3)) = 0;
        xlswrite('G:\study\2018暑假\智能汽车课题组\For Weijian_20180704\代码\【数据】\rain_week_old.xlsx',sun_spss3);
    end
end