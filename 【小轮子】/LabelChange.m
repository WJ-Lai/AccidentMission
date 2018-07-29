%输入：
%数字Label
%输出：
%文字Label
function [label_new] = LabelChange(label)

    [m, n] = size(label);
    label_new = {};
    for i = 1:m
        if label(i,1) == 1 || label(i,1)  == 5
            label_new(i,1) = {'Others'};
        elseif label(i,1)  == 2 || label(i,1)  == 6
            label_new(i,1) = {'Friday'};
        elseif label(i,1)  == 3 || label(i,1)  == 7
            label_new(i,1) = {'Saturday'};
        elseif label(i,1)  == 4 || label(i,1)  == 8
            label_new(i,1) = {'Sunday'};       
        end
    end
end