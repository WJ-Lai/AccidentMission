%���룺
%���ݼ���Label(�ַ���)
%�����
%��������
function [] = AndrewsPlot(data,label)

    figure();
    andrewsplot(data,'group',label,'quantile',.25,'LineWidth',2);
    %andrewsplot(data,'group',label,'LineWidth',2);
    set(gca,'FontSize',14);
    xlabel('t/s','Fontsize',14)
    ylabel('f(t)','Fontsize',14)

end