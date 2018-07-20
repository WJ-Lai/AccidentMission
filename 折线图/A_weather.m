%����������Data
clc;clear;
load database2.mat;

[m_Death, n_Death] = size(Death);
[m_Weather, n_Weather] = size(Weather);

%Data���ڴ�����յ����ݣ�
%���������䡢�¹����͡���������
Data = [];
%��ȡDeath������
for i_Death = 1:1:m_Death
    str = Death(i_Death,2);
    str = table2array(str);
    
    %��ȡʱ��
    pat = '\d\d\d\d-\d\d-\d\d';
    time =regexpi(str,pat,'match');
    %�ҵ����ڶ�Ӧ��id
    id = find(Day == time);
    Data(i_Death,2) = id;
    Data(i_Death,1) = Weather(id,1);
end


