import numpy as np
import pandas
from statsmodels.formula.api import ols
from statsmodels.stats.anova import anova_lm
import patsy
import csv

with open('Datasets/Exchangerate.csv') as csvfile:
    readCSV = csv.reader(csvfile, delimiter=',')
    next(readCSV)
    weeks = []
    months = []
    years = []
    rates = []
    for row in readCSV:
        week = row[0]
        month = row[2]
        year = row[3]
        rate = row[4]

        weeks.append(week)
        months.append(month)
        years.append(year)
        rates.append(rate)

weeks_flatten = np.ndarray.flatten(np.array(weeks))
months_flatten = np.ndarray.flatten(np.array(months))
years_flatten = np.ndarray.flatten(np.array(years))
rates_flatten = np.ndarray.flatten(np.array(rates))
x = np.column_stack((weeks_flatten,months_flatten,years_flatten))
print(weeks_flatten)
data = pandas.DataFrame({'Week':weeks_flatten, 'Month':months_flatten, 'Year':years_flatten, 'Rate':rates_flatten})
print(data)

