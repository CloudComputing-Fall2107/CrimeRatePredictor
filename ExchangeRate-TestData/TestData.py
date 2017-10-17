import boto3
import csv
import datetime as dt
import sys

dynamodb = boto3.resource('dynamodb',aws_access_key_id=sys.argv[1],aws_secret_access_key=sys.argv[2],region_name='us-east-2')
table = dynamodb.Table('exchange_dynamo_table')

with open('TestData.csv') as csvfile:
    readCSV = csv.reader(csvfile, delimiter=',')
    next(readCSV)
    months = []
    years = []
    days = []
    for row in readCSV:
        day = row[0]
        month = row[1]
        year = row[2]

        days.append(int(day))
        months.append(int(month))
        years.append(int(year))

date_ordinal = []
for (yr, mo, dy) in zip(years, months, days):
    date_ordinal.append(dt.date(yr, mo, dy).toordinal())

for x in date_ordinal:
    table.put_item(
        Item={
            'DateOrdinal': x,
            'ExchangeRate': 0,
        }
    )
