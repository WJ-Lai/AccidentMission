%�����ͼ��뵽Data��
clc;clear;
load database4.mat;

[m_AccidentType, n_AccidentType] = size(AccidentType);

for i_AccidentType = 1:1:m_AccidentType

    %��������
    type = AccidentType(i_AccidentType,5);
    type = table2array(type);
    Data(i_AccidentType,4) = type;
    
end
