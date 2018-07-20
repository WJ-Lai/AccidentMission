#coding=utf-8
import xlrd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cbook as cbook

#获取数据
file_path = r'FinalData.xlsx'
data = xlrd.open_workbook(file_path)

#获取sheet
table = data.sheet_by_name('Sheet1')


#获取总行数
nrows = table.nrows
#获取总列数
ncols = table.ncols

size_accident= 100
size_death = 2000
#读取青年组数据
Y_accident = np.array(table.col_values(1))
Y_accident = Y_accident * size_accident
Y_death = np.array(table.col_values(2))
Y_death = Y_death * size_death

#读取中年组数据
M_accident = np.array(table.col_values(3))
M_accident = M_accident * size_accident
M_death = np.array(table.col_values(4))
M_death = M_death * size_death

#读取老年组数据
O_accident = np.array(table.col_values(5))
O_accident = O_accident * size_accident
O_death = np.array(table.col_values(6))
O_death = O_death * size_death

#绘图
fig, ax = plt.subplots()
#使x坐标轴等距
x = np.arange(22)
ax.set_xticklabels(['11','12','13','19','21','22','23','29','30','31','32','33','34','35','36','37','38','40','50','70','80','90'],fontsize=12)
#s控制大小，不同的类用不同的type，alpha是透明度
#young = ax.scatter(x,Y_accident, s=Y_death, alpha=0.5)
#middle= ax.scatter(x,M_accident, s=M_death, alpha=0.5)
#old = ax.scatter(x,O_accident, s=O_death, alpha=0.5)
young = ax.scatter(x,Y_death, s=Y_death, alpha=0.5)
middle= ax.scatter(x,M_death, s=M_death, alpha=0.5)
old = ax.scatter(x,O_acciden, s=O_death, alpha=0.5)

#设置坐标轴文字
ax.set_xlabel('Accident Type', fontsize=15)
ax.set_ylabel('Accident rate (%)', fontsize=15)
ax.set_title('Crash Involvement Pattern of Different Age Group on Sunny Day', fontsize=15)
#设置坐标轴最大最小值
plt.xlim(-1,22)
 
#只显示竖线
ax.grid(axis= 'x')
fig.tight_layout()
#设置图例
plt.legend((young, middle, old),('Young','Middle','Old'),markerscale = 0.2,scatterpoints=1)


ax.set_xticks([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21])
plt.show()
