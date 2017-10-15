import numpy as np
from sklearn import linear_model
import csv
import datetime as dt

with open('Datasets/Exchangerate.csv') as csvfile:
    readCSV = csv.reader(csvfile, delimiter=',')
    next(readCSV)
    months = []
    years = []
    rates = []
    days = []
    for row in readCSV:
        day = row[1]
        month = row[2]
        year = row[3]
        rate = row[4]

        days.append(int(day))
        months.append(int(month))
        years.append(int(year))
        rates.append(rate)

date_ordinal = []
for (yr, mo, dy) in zip(years,months,days):
    date_ordinal.append(dt.date(yr,mo,dy).toordinal())

model = linear_model.LinearRegression()
x = np.reshape(date_ordinal, (len(date_ordinal), 1))
y = np.reshape(rates, (len(rates), 1))
model.fit(x, y)

test = dt.date(2020,10,30).toordinal()
print(model.predict(test))
