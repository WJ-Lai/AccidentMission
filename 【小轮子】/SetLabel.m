%���룺
%���ݼ�
%�����
%�������������ڣ���ע��label����δ�ֵڼ��ܣ�
function data_with_label = SetLabel(data)

    [m n] = size(data);
    data_with_label = zeros(m, n+1);
    for i = 1:m
        %��Ϊ����
        if data(i,1) == 0
            switch data(i,3)
                %��Ϊ����һ
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
        %��Ϊ����
        if data(i,1) == 1
            switch data(i,3)
                %��Ϊ����һ
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