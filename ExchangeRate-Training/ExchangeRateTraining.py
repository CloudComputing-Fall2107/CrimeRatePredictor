import numpy as np
import pandas
from statsmodels.formula.api import ols
from statsmodels.stats.anova import anova_lm
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
print(weeks)