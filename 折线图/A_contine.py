# -*- coding: utf-8 -*-

start=6  #开始的行
end=106  #结束的行
 
rows=end-start

list_values=[]
for x in range(start,end):
    values=[]
    row =table.row_values(x)
    for i in range(1,7):
        # print(value)
        values.append(row[i])
    list_values.append(values)
# print(list_values)
datamatrix=np.array(list_values)

print(datamatrix)
