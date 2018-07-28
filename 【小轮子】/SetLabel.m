%输入：
%数据集
%输出：
%根据天气和星期，标注上label（还未分第几周）
function data_with_label = SetLabel(data)

    [m n] = size(data);
    data_with_label = zeros(m, n+1);
    for i = 1:m
        %若为晴天
        if data(i,1) == 0
            switch data(i,3)
                %若为星期一
                case  {1, 2, 3, 4}
                    data(i,9) = 1;
                case  5
                    data(i,9) = 2;
                case  6
                    data(i,9) = 3;
                case  7
                    data(i,9) = 4;
            end
        end
        %若为雨天
        if data(i,1) == 1
            switch data(i,3)
                %若为星期一
                case  {1, 2, 3, 4}
                    data(i,9) = 5;
                case  5
                    data(i,9) = 6;
                case  6
                    data(i,9) = 7;
                case  7
                    data(i,9) = 8;
            end
        end
    end
    data_with_label = data;
    
end