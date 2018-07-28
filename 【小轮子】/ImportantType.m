%���룺
%ԭʼ���ݣ���Ҫ�ĸ���n
%�����
%����������̬�����������˸�����״ͼ��ǰN������������ı��
function  [id_death, id_hurt] = ImportantType(data_week, number)

    %���ñ��
    num_typt = [11 12 13 19 21 22 23 29 30 31 32 33 34 35 36 37 38 40 50 60 70 80 99];
    [m, n] = size(data_week);
    %������������������
    sum_death = sum(data_week(:,2:24));
    sum_hurt = sum(data_week(:,25:47));
    sum_all = [sum_death; sum_hurt];
   
    %�ɴ�С����
    [result_death, id_death] = sort(sum_death,'descend');
    [result_hurt, id_hurt] = sort(sum_hurt,'descend');   
    
    %���ǰn����ֵ���
    top_death = sum_death(id_death(1:number));
    top_hurt = sum_hurt(id_hurt(1:number));
    
    %������������ֱ��ͼ
    bar(top_death);
    alpha(0.5);
    set(gca,'YScale','log','Fontsize',12);
    set(gca,'XTickLabel',num_typt(id_death(1:number)))
    xlabel('Accident Types','Fontsize',14); ylabel('The Amount of Deaths');
    title('The Amount of Deaths about Different Accident Types');
    
    %������������ֱ��ͼ
    figure()
    bar(top_hurt);
    alpha(0.5);
    set(gca,'YScale','log','Fontsize',12);
    set(gca,'XTickLabel',num_typt(id_hurt(1:number)))
    xlabel('Accident Types'); ylabel('The Amount of Hurts');
    title('The Amount of Hurts about Different Accident Types');
    
    
 
end