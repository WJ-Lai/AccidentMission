%���룺
%���ݼ���Label(�ַ���)
%�����
%��������
function [] = AndrewsPlot2(data,label)

    figure();
    %andrewsplot(data,'group',label,'quantile',.25,'LineWidth',2);
    andrewsplot(data,'group',label);
    set(gca,'FontSize',17);
    xlabel('t/s','Fontsize',18)
    ylabel('f(t)','Fontsize',18)

end