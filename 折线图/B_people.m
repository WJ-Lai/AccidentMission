%�����䡢���˼��뵽Data��
clc;clear;
load database3.mat;

[m_Death, n_Death] = size(Death);

for i_Death = 1:1:m_Death
    %��������
    age = Death(i_Death,6);
    age = table2array(age);
    Data(i_Death,3) = age;
    
    
    %������������
    death = Death(i_Death,12);
    death = table2array(death);
    Data(i_Death,5) = death;
    
    %������������
    hurt = Death(i_Death,17);
    hurt = table2array(hurt);
    Data(i_Death,6) = hurt;
    
    
end