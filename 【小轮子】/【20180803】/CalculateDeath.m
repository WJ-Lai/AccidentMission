%���룺
%ĳһ�ε�����
%�����
%ͳ�Ʋ�ͬ�¹����͵�����
function [weather] = CalculateDeath(data_with_label, weather)

    loc_accident = AccidentType(data_with_label(1,4));
    weather(1,loc_accident) = weather(1,loc_accident) + data_with_label(1,7);

end