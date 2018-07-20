%将类型加入到Data中
clc;clear;
load database4.mat;

[m_AccidentType, n_AccidentType] = size(AccidentType);

for i_AccidentType = 1:1:m_AccidentType

    %加入类型
    type = AccidentType(i_AccidentType,5);
    type = table2array(type);
    Data(i_AccidentType,4) = type;
    
end
