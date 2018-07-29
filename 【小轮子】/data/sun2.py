#-*- coding: utf-8 -*-
import xlrd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cbook as cbook

#获取数据
#相对死亡率
file_path = r'sun2.xlsx'
#死亡率
#file_path = r'sun2.xlsx'
data = xlrd.open_workbook(file_path)

#获取sheet
table = data.sheet_by_name('Sheet1')


#获取总行数
nrows = table.nrows
#获取总列数
ncols = table.ncols

size_accident= 100
size_death = 120000
#读取青年组数据
Y_accident = np.array(table.col_values(0))
Y_accident = Y_accident * size_accident
Y_death = np.array(table.col_values(1))
Y_death = Y_death * size_death

#读取中年组数据
M_accident = np.array(table.col_values(2))
M_accident = M_accident * size_accident
M_death = np.array(table.col_values(3))
M_death = M_death * size_death

#读取老年组数据
O_accident = np.array(table.col_values(4))
O_accident = O_accident * size_accident
O_death = np.array(table.col_values(5))
O_death = O_death * size_death

#绘图
fig, ax = plt.subplots()
#使x坐标轴等距
x = np.arange(5)
ax.set_xticklabels(['CSV','CS','OVA','SP','HF'],fontsize=12)
#s控制大小，不同的类用不同的type，alpha是透明度
young = ax.scatter(x,Y_accident, s=Y_death, alpha=0.5)
middle= ax.scatter(x,M_accident, s=M_death, alpha=0.5)
old = ax.scatter(x,O_accident, s=O_death, alpha=0.5)
 
#设置坐标轴文字
ax.set_xlabel('Accident Type', fontsize=15)
ax.set_ylabel('Accident rate (%)', fontsize=15)
ax.set_title('Crash Involvement Pattern on Sunny Day', fontsize=15)
plt.yscale('log')
#设置坐标轴最大最小值
plt.xlim(-1,5)
plt.ylim(0.1,1000)
 
#只显示竖线
ax.grid(axis= 'x')
fig.tight_layout()
#设置图例
plt.legend((young, middle, old),('Young','Middle','Old'),markerscale = 0.2)

ax.set_xticks([0,1,2,3,4])
plt.show()
