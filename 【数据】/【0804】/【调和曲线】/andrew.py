import pandas
import pandas as pd
import numpy as np
import matplotlib
import matplotlib.pyplot as plt

url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
names = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
dataset = pandas.read_csv(url, names=names)

from pandas.plotting import andrews_curves
andrews_curves(dataset,'class')

plt.show()
