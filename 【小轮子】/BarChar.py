#-*- coding: utf-8 -*-
import xlrd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cbook as cbook

#获取数据
file_path = 'data_accident.xlsx'
data = xlrd.open_workbook(file_path)
sheets=data.sheets()
sheets
