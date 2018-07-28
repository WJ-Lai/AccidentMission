%输入：
%事故的编号
%输出：
%输出属于事故形态对应的编号
function loc_accident = AccidentType(accident_type)
    
    switch accident_type
        case 11
            loc_accident = 1;
        case 12
            loc_accident = 2;
        case 13
            loc_accident = 3;
        case 19
            loc_accident = 4;
        case 21
            loc_accident = 5;
        case 22
            loc_accident = 6;
        case 23
            loc_accident = 7;
        case 29
            loc_accident = 8;
        case 30
            loc_accident = 9;
        case 31
            loc_accident = 10;
        case 32
            loc_accident = 11;
        case 33
            loc_accident = 12;
        case 34
            loc_accident = 13;
        case 35
            loc_accident = 14;
        case 36
            loc_accident = 15;
        case 37
            loc_accident = 16;
        case 38
            loc_accident = 17;
        case 40
            loc_accident = 18;
        case 50
            loc_accident = 19;
        case 60
            loc_accident = 20;
        case 70
            loc_accident = 21;
        case 80
            loc_accident = 22;
        case 99
            loc_accident = 23;
        otherwise
            accident_type

end