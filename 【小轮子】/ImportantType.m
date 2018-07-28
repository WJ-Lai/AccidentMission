%输入：
%原始数据，想要的个数n
%输出：
%所有数个形态的死亡、受伤个数柱状图、前N个死亡个数多的编号
function  [id_death, id_hurt] = ImportantType(data_week, number)

    %设置编号
    num_typt = [11 12 13 19 21 22 23 29 30 31 32 33 34 35 36 37 38 40 50 60 70 80 99];
    [m, n] = size(data_week);
    %计算死亡、受伤总数
    sum_death = sum(data_week(:,2:24));
    sum_hurt = sum(data_week(:,25:47));
    sum_all = [sum_death; sum_hurt];
   
    %由大到小排序
    [result_death, id_death] = sort(sum_death,'descend');
    [result_hurt, id_hurt] = sort(sum_hurt,'descend');   
    
    %输出前n个数值最大
    top_death = sum_death(id_death(1:number));
    top_hurt = sum_hurt(id_hurt(1:number));
    
    %绘制死亡人数直方图
    bar(top_death);
    alpha(0.5);
    set(gca,'YScale','log','Fontsize',12);
    set(gca,'XTickLabel',num_typt(id_death(1:number)))
    xlabel('Accident Types','Fontsize',14); ylabel('The Amount of Deaths');
    title('The Amount of Deaths about Different Accident Types');
    
    %绘制受伤人数直方图
    figure()
    bar(top_hurt);
    alpha(0.5);
    set(gca,'YScale','log','Fontsize',12);
    set(gca,'XTickLabel',num_typt(id_hurt(1:number)))
    xlabel('Accident Types'); ylabel('The Amount of Hurts');
    title('The Amount of Hurts about Different Accident Types');
    
    
 
end